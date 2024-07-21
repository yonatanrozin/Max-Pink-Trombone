"""Prints the palm position of each hand, every frame. When a device is 
connected we set the tracking mode to desktop and then generate logs for 
every tracking frame received. The events of creating a connection to the 
server and a device being plugged in also generate logs. 
"""

import leap
import time
import sys
import json
import math
import numpy as np
from scipy.spatial.transform import Rotation

digMins = [3, 3, 12, 15]
digMaxs = [70, 80, 80, 70]

def scale(n, start1, stop1, start2, stop2, withinBounds=True):
    newval = (n - start1) / (stop1 - start1) * (stop2 - start2) + start2

    if not withinBounds:
        return newval
        
    if start2 < stop2: 
        return constrain(newval, start2, stop2)
    else:
        return constrain(newval, stop2, start2)

def constrain(n, low, high):
    return min(max(n, low), high)

fps = 60

class MyListener(leap.Listener):

    frameTime = 5
    # def on_connection_event(self, event):
    #     print("Connected")

    def on_device_event(self, event):
        try:
            with event.device.open():
                info = event.device.get_info()
        except leap.LeapCannotOpenDeviceError:
            info = event.device.get_info()

    def on_tracking_event(self, event):

        newTime = leap.get_now()//(1000000/fps)
        if newTime == self.frameTime:
            return
        else:
            self.frameTime = newTime

        for i in range(len(event.hands)):

            hand = event.hands[i]

            if not hand.type == leap.HandType.Right:
                continue
                
            [x, y, z] = [int(val) for val in list(hand.palm.position)]

            q = hand.digits[3].proximal.rotation
            r = round(math.asin(-2.0*(q.x*q.z - q.w*q.y)), 3)

            # extStates = [not dig.is_extended for dig in hand.digits]
            # extends = [ext for ext in extStates if ext]


            digBase = [list(d.proximal.prev_joint) for d in hand.digits[1:]]
            digTip = [list(d.distal.next_joint) for d in hand.digits[1:]]
            digDiff = [np.asarray(t) - np.asarray(b) for (t, b) in zip(digTip, digBase)]

            rotation = Rotation.from_quat(np.array(list(hand.palm.orientation)))
            diffRotated = [rotation.inv().apply(diff) for diff in digDiff]

            digBend = [np.arctan2(rot[1], rot[2]) * 180/math.pi % 360 for rot in diffRotated]
            digScale = [scale(b, 180, 290, 0, 1) for b in digBend]

            sMax = max(digScale)
            digPos = [scale(d, .35, .95, 0, 1) for d in digScale if d > .2 and sMax - d < .4]

            num = len(digPos)
            # val = 0 if not num else round(max(digPos), 2)

            dataOut = {"x": x, "y": y, "z": z, "r": r, "num": num}

            print(json.dumps(dataOut))
            sys.stdout.flush()

            break

def main():
    my_listener = MyListener()

    connection = leap.Connection()
    connection.add_listener(my_listener)

    running = True

    with connection.open():
        connection.set_tracking_mode(leap.TrackingMode.Desktop)
        while running:
            time.sleep(1000)

# pyinstaller --onefile --paths=D:\env\Lib\site-packages  --hidden-import _cffi_backend .\tracking_event_example.py


if __name__ == "__main__":
    main()
