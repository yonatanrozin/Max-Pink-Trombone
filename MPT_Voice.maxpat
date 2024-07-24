{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 6,
			"revision" : 1,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
<<<<<<< HEAD
		"rect" : [ 134.0, 134.0, 1373.0, 743.0 ],
=======
		"rect" : [ 754.0, 82.0, 651.0, 736.0 ],
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
<<<<<<< HEAD
					"id" : "obj-4",
=======
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 213.0, 300.0, 189.0, 22.0 ],
					"text" : "loadmess targetDiameter #0_td"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"patching_rect" : [ 213.0, 276.0, 160.0, 22.0 ],
					"text" : "buffer~ #0_td @samps 44"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-23",
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
<<<<<<< HEAD
					"patching_rect" : [ 336.0, 67.0, 336.0, 22.0 ],
					"saved_object_attributes" : 					{
						"attr_comment" : [ "(optional", "signal~)", "custom", "glottal", "source" ]
					}
,
					"text" : "in~ 3 @attr_comment (optional signal~) custom glottal source"
=======
					"patching_rect" : [ 194.0, 170.0, 240.0, 22.0 ],
					"saved_object_attributes" : 					{
						"attr_comment" : [ "custom", "glottal", "source" ]
					}
,
					"text" : "in~ 3 @attr_comment custom glottal source"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 47.0, 348.0, 239.0, 22.0 ],
					"saved_object_attributes" : 					{
						"attr_comment" : [ "tract", "param", "messages" ]
					}
,
					"text" : "in 2 @attr_comment tract param messages"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 18.0, 581.0, 42.0, 22.0 ],
					"saved_object_attributes" : 					{
						"attr_comment" : ""
					}
,
					"text" : "out~ 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 17.600000262260437, 19.200000286102295, 247.0, 22.0 ],
					"saved_object_attributes" : 					{
						"attr_comment" : [ "glottis", "param", "messages" ]
					}
,
					"text" : "in 1 @attr_comment glottis param messages"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 18.400000274181366, 87.200001299381256, 42.0, 22.0 ],
					"text" : "$1 50."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 18.400000274181366, 116.000001728534698, 34.0, 22.0 ],
					"text" : "line~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 18.0, 537.0, 34.0, 22.0 ],
					"text" : "*~ 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 17.600000262260437, 55.200000822544098, 88.0, 22.0 ],
					"text" : "route useVoice"
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
<<<<<<< HEAD
					"patching_rect" : [ 190.400002837181091, 352.800005257129669, 109.0, 22.0 ],
=======
					"patching_rect" : [ 84.0, 457.0, 109.0, 22.0 ],
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
					"text" : "reson~ 1. 1000 0.5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
<<<<<<< HEAD
					"patching_rect" : [ 190.400002837181091, 322.400004804134369, 29.5, 22.0 ],
=======
					"patching_rect" : [ 84.0, 426.0, 29.5, 22.0 ],
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
					"text" : "/~ 2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
<<<<<<< HEAD
					"patching_rect" : [ 190.400002837181091, 293.600004374980927, 44.0, 22.0 ],
=======
					"patching_rect" : [ 84.0, 383.0, 44.0, 22.0 ],
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
					"text" : "noise~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
<<<<<<< HEAD
					"patching_rect" : [ 161.0, 184.0, 102.0, 22.0 ],
=======
					"patching_rect" : [ 113.5, 137.0, 102.0, 22.0 ],
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
					"text" : "reson~ 1. 500 0.5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
<<<<<<< HEAD
					"patching_rect" : [ 161.0, 154.0, 29.5, 22.0 ],
=======
					"patching_rect" : [ 113.5, 109.0, 29.5, 22.0 ],
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
					"text" : "/~ 2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
<<<<<<< HEAD
					"patching_rect" : [ 161.0, 125.0, 44.0, 22.0 ],
=======
					"patching_rect" : [ 113.5, 80.0, 44.0, 22.0 ],
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
					"text" : "noise~"
				}

			}
, 			{
				"box" : 				{
<<<<<<< HEAD
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 349.600005209445953, 321.60000479221344, 63.0, 22.0 ],
					"text" : "metro 100"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-25",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 372.800005555152893, 287.200004279613495, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-17",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 169.0, 477.0, 114.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 161.0, 417.0, 59.0, 22.0 ],
					"text" : "route cpu"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 352.00000524520874, 352.800005257129669, 45.0, 22.0 ],
					"text" : "getcpu"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 55.0, 63.0, 247.0, 22.0 ],
					"saved_object_attributes" : 					{
						"attr_comment" : [ "glottis", "param", "messages" ]
					}
,
					"text" : "in 1 @attr_comment glottis param messages"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 372.800005555152893, 256.800003826618195, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.067034184932709, 413.0, 42.0, 22.0 ],
					"saved_object_attributes" : 					{
						"attr_comment" : ""
					}
,
					"text" : "out~ 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 83.564333856105804, 259.200003862380981, 232.0, 22.0 ],
					"saved_object_attributes" : 					{
						"attr_comment" : [ "tract", "param", "messges" ]
					}
,
					"text" : "in 2 @attr_comment tract param messges"
				}

			}
, 			{
				"box" : 				{
=======
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
					"id" : "obj-76",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
<<<<<<< HEAD
					"outlettype" : [ "signal", "" ],
					"patching_rect" : [ 50.400000751018524, 385.600005745887756, 298.0, 22.0 ],
					"text" : "gen~ tract_processor @cpumeasure 1 @dumpoutlet 2"
=======
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 33.0, 491.0, 180.000002682209015, 22.0 ],
					"text" : "gen~ tract_processor"
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-44",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 32.800000488758087, 321.60000479221344, 29.5, 22.0 ],
					"text" : "+~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "signal" ],
					"patching_rect" : [ 33.0, 212.0, 180.0, 22.0 ],
					"text" : "gen~ glottis_processor"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 1 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"source" : [ "obj-11", 0 ]
<<<<<<< HEAD
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"source" : [ "obj-14", 0 ]
=======
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
				}

			}
, 			{
				"patchline" : 				{
<<<<<<< HEAD
					"destination" : [ "obj-17", 0 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 1 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-26", 0 ]
=======
					"destination" : [ "obj-21", 0 ],
					"source" : [ "obj-12", 0 ]
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
				}

			}
, 			{
				"patchline" : 				{
<<<<<<< HEAD
=======
					"destination" : [ "obj-9", 0 ],
					"source" : [ "obj-12", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
					"destination" : [ "obj-76", 0 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
<<<<<<< HEAD
					"destination" : [ "obj-9", 2 ],
					"source" : [ "obj-4", 0 ]
=======
					"destination" : [ "obj-13", 0 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 1 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 2 ],
					"source" : [ "obj-23", 0 ]
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-7", 0 ]
<<<<<<< HEAD
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"source" : [ "obj-76", 1 ]
=======
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 1 ],
					"source" : [ "obj-76", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 1 ],
					"source" : [ "obj-9", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 2 ],
					"source" : [ "obj-9", 2 ]
				}

			}
 ]
	}

}
