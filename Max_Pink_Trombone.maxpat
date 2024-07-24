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
		"rect" : [ 34.0, 82.0, 1067.0, 730.0 ],
=======
		"rect" : [ 34.0, 76.0, 1373.0, 743.0 ],
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
					"id" : "obj-33",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 163.740734159946442, 341.0, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 483.600000441074371, 251.0, 150.0, 20.0 ],
					"text" : "load a custom sound file"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 140.0, 339.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 454.0, 249.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
=======
					"id" : "obj-54",
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
<<<<<<< HEAD
					"patching_rect" : [ 127.0, 388.0, 33.0, 22.0 ],
					"text" : "read"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"patching_rect" : [ 127.0, 426.0, 73.0, 22.0 ],
					"text" : "buffer~ note"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 247.0, 422.0, 64.0, 22.0 ],
					"text" : "play~ note"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-91",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 233.0, 372.0, 150.0, 34.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 483.600000441074371, 282.400004208087921, 150.0, 34.0 ],
					"text" : "toggle custom glottal source"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-89",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 207.0, 377.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 454.0, 287.200004279613495, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-87",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 207.0, 454.0, 58.0, 22.0 ],
					"text" : "selector~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-55",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 212.0, 208.0, 99.0, 22.0 ],
					"text" : "expr pow($f1\\, .5)"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-47",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 8,
					"outlettype" : [ "", "", "", "int", "int", "", "int", "" ],
					"patching_rect" : [ 85.0, 50.0, 92.5, 22.0 ],
					"text" : "midiparse"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-46",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 85.0, 26.0, 40.0, 22.0 ],
					"text" : "midiin"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 85.0, 75.0, 41.0, 22.0 ],
					"text" : "unjoin"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 841.0, 51.0, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 501.0, 134.0, 172.0, 20.0 ],
					"text" : "Press to import recordings"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 888.0, 215.0, 150.0, 34.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 592.0, 181.0, 150.0, 34.0 ],
					"text" : "Select recording name, scrub through it with slider"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 815.0, 49.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 453.0, 121.0, 46.0, 46.0 ]
				}

			}
, 			{
				"box" : 				{
					"floatoutput" : 1,
					"id" : "obj-31",
					"maxclass" : "slider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"orientation" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 763.0, 226.0, 99.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 454.0, 199.0, 136.0, 20.0 ],
					"size" : 1.0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 815.0, 288.0, 73.0, 22.0 ],
					"text" : "frame $2 $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 815.0, 257.0, 29.5, 22.0 ],
					"text" : "join"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-23",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 815.0, 167.0, 65.0, 22.0 ],
					"text" : "append $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 885.0, 153.0, 52.0, 36.0 ],
					"text" : "clear, append"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"items" : [ ",", "ff", ",", "awef" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 762.0, 202.0, 100.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 453.0, 175.0, 137.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 815.0, 138.0, 47.0, 22.0 ],
					"text" : "zl.iter 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-38",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 815.0, 325.0, 84.0, 22.0 ],
					"saved_object_attributes" : 					{
						"filename" : "getFrame.js",
						"parameter_enable" : 0
					}
,
					"text" : "js getFrame.js"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 815.0, 77.0, 123.0, 22.0 ],
					"text" : "import, getkeys, bang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 5,
					"outlettype" : [ "dictionary", "", "", "", "" ],
					"patching_rect" : [ 815.0, 107.0, 69.0, 22.0 ],
					"saved_object_attributes" : 					{
						"embed" : 0,
						"legacy" : 0,
						"parameter_enable" : 0,
						"parameter_mappable" : 0
					}
,
					"text" : "dict speech"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 651.0, 144.0, 32.0, 22.0 ],
=======
					"patching_rect" : [ 437.000007152557373, 157.600002348423004, 32.0, 22.0 ],
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
					"text" : "n $1"
				}

			}
, 			{
				"box" : 				{
<<<<<<< HEAD
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 155.740734159946442, 208.0, 39.0, 22.0 ],
					"text" : "/ 127."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 121.740734159946442, 208.0, 32.0, 22.0 ],
					"text" : "mtof"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 88.740734159946442, 260.0, 118.823534369468661, 22.0 ],
					"text" : "join 4"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 4,
					"outlettype" : [ "int", "int", "int", "list" ],
					"patching_rect" : [ 88.740734159946442, 180.0, 118.823534369468689, 22.0 ],
					"text" : "poly"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "kslider",
					"mode" : 1,
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 88.740734159946442, 110.0, 336.0, 53.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 75.0, 459.20000684261322, 364.0, 57.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 88.740734159946442, 292.0, 300.0, 22.0 ],
					"text" : "target $1, frequency $2, tensenessMult $3, intensity $4"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 88.740734159946442, 499.0, 176.0, 22.0 ],
					"text" : "poly~ MPT_Voice 1 @parallel 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-78",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 139.740734159946442, 593.0, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 75.0, 587.0, 144.0, 20.0 ],
					"text" : "Enable audio to use GUI"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-62",
=======
					"id" : "obj-50",
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
<<<<<<< HEAD
					"patching_rect" : [ 443.0, 127.0, 41.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 249.342102885246277, 71.0, 41.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.dial[3]",
							"parameter_mmax" : 3.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "C_Diam",
							"parameter_steps" : 100,
							"parameter_type" : 0,
=======
					"patching_rect" : [ 437.000007152557373, 90.400001347064972, 41.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_initial" : [ 44 ],
							"parameter_initial_enable" : 1,
							"parameter_longname" : "Tract Length (n)",
							"parameter_mmax" : 44.0,
							"parameter_mmin" : 30.0,
							"parameter_modmode" : 4,
							"parameter_shortname" : "Tract_N",
							"parameter_type" : 1,
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
							"parameter_unitstyle" : 1
						}

					}
,
					"varname" : "live.dial[5]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-48",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
<<<<<<< HEAD
					"patching_rect" : [ 443.0, 216.0, 135.0, 22.0 ],
					"text" : "constrictionDiameter $1"
=======
					"patching_rect" : [ 652.000007152557373, 253.600002348423004, 86.0, 22.0 ],
					"text" : "lipDiameter $1"
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-44",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
<<<<<<< HEAD
					"patching_rect" : [ 478.0, 103.0, 41.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 204.0, 71.0, 41.0, 48.0 ],
=======
					"patching_rect" : [ 652.000007152557373, 90.400001347064972, 41.0, 48.0 ],
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_initial" : [ 1.5 ],
							"parameter_initial_enable" : 1,
							"parameter_longname" : "Lip Diameter",
							"parameter_mmax" : 1.5,
							"parameter_modmode" : 3,
							"parameter_shortname" : "lip_dia",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"varname" : "live.dial[4]"
				}

			}
, 			{
				"box" : 				{
<<<<<<< HEAD
					"id" : "obj-65",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 478.0, 192.0, 115.0, 22.0 ],
					"text" : "constrictionIndex $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-60",
=======
					"id" : "obj-39",
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
<<<<<<< HEAD
					"patching_rect" : [ 514.0, 79.0, 41.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 161.0, 71.0, 41.0, 48.0 ],
=======
					"patching_rect" : [ 609.000007152557373, 90.400001347064972, 41.0, 48.0 ],
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_initial" : [ 0.0 ],
							"parameter_longname" : "Constriction Diameter",
							"parameter_mmax" : 44.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "c_dia",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"varname" : "live.dial[3]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-41",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 609.000007152557373, 229.600002348423004, 135.0, 22.0 ],
					"text" : "constrictionDiameter $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-37",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 566.000007152557373, 90.400001347064972, 41.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_initial" : [ 0.0 ],
							"parameter_longname" : "Constriction Index",
							"parameter_mmax" : 44.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "c_index",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"varname" : "live.dial[2]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-38",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
<<<<<<< HEAD
					"patching_rect" : [ 514.0, 168.0, 111.0, 22.0 ],
					"text" : "tongueDiameter $1"
=======
					"patching_rect" : [ 566.000007152557373, 205.600002348423004, 115.0, 22.0 ],
					"text" : "constrictionIndex $1"
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-35",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
<<<<<<< HEAD
					"patching_rect" : [ 549.0, 56.0, 41.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 118.0, 71.0, 41.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.dial[1]",
							"parameter_mmax" : 29.0,
							"parameter_mmin" : 12.9,
=======
					"patching_rect" : [ 523.000007152557373, 90.400001347064972, 41.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_initial" : [ 2.43 ],
							"parameter_initial_enable" : 1,
							"parameter_longname" : "Tongue Diameter",
							"parameter_mmax" : 3.5,
							"parameter_mmin" : 2.05,
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
							"parameter_modmode" : 3,
							"parameter_shortname" : "t_dia",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}

					}
,
					"varname" : "live.dial[1]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-36",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
<<<<<<< HEAD
					"patching_rect" : [ 549.0, 144.0, 91.0, 22.0 ],
					"text" : "tongueIndex $1"
=======
					"patching_rect" : [ 523.000007152557373, 181.600002348423004, 111.0, 22.0 ],
					"text" : "tongueDiameter $1"
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-34",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
<<<<<<< HEAD
					"patching_rect" : [ 670.0, 62.0, 41.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 75.0, 71.0, 41.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_initial" : [ 44 ],
							"parameter_initial_enable" : 1,
							"parameter_longname" : "Tract Length",
							"parameter_mmax" : 44.0,
							"parameter_mmin" : 30.0,
							"parameter_modmode" : 4,
							"parameter_shortname" : "Tract N",
							"parameter_type" : 1,
							"parameter_unitstyle" : 0
=======
					"patching_rect" : [ 480.000007152557373, 90.400001347064972, 41.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_initial" : [ 12.9 ],
							"parameter_initial_enable" : 1,
							"parameter_longname" : "Tongue Index",
							"parameter_mmax" : 29.0,
							"parameter_mmin" : 12.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "t_index",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
						}

					}
,
					"varname" : "live.dial"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
<<<<<<< HEAD
					"patching_rect" : [ 717.0, 631.0, 50.0, 22.0 ],
					"text" : "0 0.3"
=======
					"patching_rect" : [ 480.000007152557373, 157.600002348423004, 91.0, 22.0 ],
					"text" : "tongueIndex $1"
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 112.800001680850983, 420.80000627040863, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
<<<<<<< HEAD
					"patching_rect" : [ 550.0, 631.0, 50.0, 36.0 ],
					"text" : "20.25 3.49"
=======
					"patching_rect" : [ 459.5, 443.0, 50.0, 22.0 ],
					"text" : "13 3.5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 526.0, 443.0, 50.0, 22.0 ],
					"text" : "0 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 292.000004351139069, 449.600006699562073, 59.0, 22.0 ],
					"text" : "rect~ 100"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 112.800001680850983, 449.600006699562073, 171.0, 22.0 ],
					"text" : "target 1, useCustomSource $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-107",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 634.000007152557373, 345.600005149841309, 59.0, 22.0 ],
					"text" : "target 1 2"
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
				}

			}
, 			{
				"box" : 				{
					"border" : 0,
					"filename" : "TractUI.js",
					"id" : "obj-74",
					"maxclass" : "jsui",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"parameter_enable" : 0,
<<<<<<< HEAD
					"patching_rect" : [ 443.0, 279.0, 353.0, 332.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 75.0, 121.0, 364.000005424022675, 333.600004971027374 ]
=======
					"patching_rect" : [ 424.0, 271.80000501871109, 152.0, 152.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 90.0, 499.0, 183.0, 22.0 ],
					"text" : "poly~ MPT_Voice 10 @parallel 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 89.600001335144043, 392.800005853176117, 305.0, 22.0 ],
					"text" : "target $1, frequency $2, tensenessMult $3, useVoice $4"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-42",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 122.33333432674408, 127.1515132188797, 19.0, 19.0 ]
				}

			}
, 			{
				"box" : 				{
					"hkeycolor" : [ 0.6, 0.0, 1.0, 1.0 ],
					"id" : "obj-3",
					"maxclass" : "kslider",
					"mode" : 1,
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 89.0, 192.0, 324.0, 41.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 157.0, 603.0, 504.0, 60.0 ],
					"range" : 61
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 144.151516795158386, 95.636360764503479, 53.0, 22.0 ],
					"text" : "route 64"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-56",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 171.0, 308.0, 128.0, 22.0 ],
					"text" : "expr pow($i1/127.0\\, 2)"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-53",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 212.0, 336.80000501871109, 126.0, 22.0 ],
					"text" : "if $i1 > 0 then 1 else 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-52",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"patching_rect" : [ 89.0, 153.818180680274963, 52.000000774860382, 22.0 ],
					"text" : "sustain"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-40",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 171.0, 281.0, 100.0, 22.0 ],
					"text" : "if $i1 > 0 then $i1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-47",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 8,
					"outlettype" : [ "", "", "", "int", "int", "", "int", "" ],
					"patching_rect" : [ 89.0, 59.272723317146301, 92.5, 22.0 ],
					"text" : "midiparse"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-46",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 89.0, 35.636358976364136, 40.0, 22.0 ],
					"text" : "midiin"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 89.0, 95.636360764503479, 52.000000774860382, 22.0 ],
					"text" : "unjoin"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 130.0, 308.0, 32.0, 22.0 ],
					"text" : "mtof"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 89.600001335144043, 362.400005400180817, 141.549022912979126, 22.0 ],
					"text" : "join 4"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 4,
					"outlettype" : [ "int", "int", "int", "list" ],
					"patching_rect" : [ 89.0, 248.0, 142.0, 22.0 ],
					"text" : "poly"
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
<<<<<<< HEAD
					"patching_rect" : [ 88.740734159946442, 580.0, 45.0, 45.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 75.0, 526.0, 60.0, 60.0 ]
=======
					"patching_rect" : [ 87.0, 558.0, 45.0, 45.0 ]
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
<<<<<<< HEAD
					"destination" : [ "obj-17", 0 ],
					"order" : 1,
					"source" : [ "obj-1", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"order" : 0,
					"source" : [ "obj-1", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 0 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-87", 1 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
=======
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
					"destination" : [ "obj-7", 1 ],
					"order" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"order" : 1,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-74", 0 ],
					"source" : [ "obj-107", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 2 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"midpoints" : [ 153.651516795158386, 122.424242496490479, 131.83333432674408, 122.424242496490479 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 1 ],
					"source" : [ "obj-28", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 0 ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-74", 0 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 1 ],
					"source" : [ "obj-19", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 0 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 1 ],
					"source" : [ "obj-28", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 1 ],
					"midpoints" : [ 403.5, 240.0, 221.5, 240.0 ],
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-74", 0 ],
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
<<<<<<< HEAD
					"destination" : [ "obj-24", 0 ],
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 1 ],
					"source" : [ "obj-38", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"source" : [ "obj-38", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"source" : [ "obj-4", 0 ]
=======
					"destination" : [ "obj-38", 0 ],
					"source" : [ "obj-37", 0 ]
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
				}

			}
, 			{
				"patchline" : 				{
<<<<<<< HEAD
					"destination" : [ "obj-47", 0 ],
					"source" : [ "obj-46", 0 ]
=======
					"destination" : [ "obj-74", 0 ],
					"source" : [ "obj-38", 0 ]
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
				}

			}
, 			{
				"patchline" : 				{
<<<<<<< HEAD
=======
					"destination" : [ "obj-41", 0 ],
					"source" : [ "obj-39", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-74", 0 ],
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 2 ],
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-48", 0 ],
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"midpoints" : [ 119.5, 90.299999833106995, 153.651516795158386, 90.299999833106995 ],
					"source" : [ "obj-47", 2 ]
				}

			}
, 			{
				"patchline" : 				{
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
					"destination" : [ "obj-28", 0 ],
					"source" : [ "obj-47", 0 ]
				}

			}
, 			{
				"patchline" : 				{
<<<<<<< HEAD
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-49", 0 ]
=======
					"destination" : [ "obj-74", 0 ],
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"order" : 1,
					"source" : [ "obj-5", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"order" : 0,
					"source" : [ "obj-5", 2 ]
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
<<<<<<< HEAD
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-5", 2 ]
				}

			}
, 			{
				"patchline" : 				{
=======
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
					"destination" : [ "obj-9", 0 ],
					"source" : [ "obj-5", 1 ]
				}

			}
, 			{
				"patchline" : 				{
<<<<<<< HEAD
					"destination" : [ "obj-6", 3 ],
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"source" : [ "obj-57", 0 ]
=======
					"destination" : [ "obj-54", 0 ],
					"source" : [ "obj-50", 0 ]
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 1 ],
					"midpoints" : [ 131.500000774860382, 183.409090340137482, 403.5, 183.409090340137482 ],
					"source" : [ "obj-52", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 3 ],
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-74", 0 ],
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
<<<<<<< HEAD
					"destination" : [ "obj-55", 0 ],
					"order" : 0,
=======
					"destination" : [ "obj-6", 2 ],
					"source" : [ "obj-56", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 1 ],
					"midpoints" : [ 433.5, 486.0, 181.5, 486.0 ],
					"source" : [ "obj-74", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 1 ],
					"source" : [ "obj-74", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 1 ],
					"source" : [ "obj-74", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 2 ],
					"order" : 1,
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 2 ],
					"source" : [ "obj-87", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"order" : 0,
					"source" : [ "obj-89", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-87", 0 ],
					"order" : 1,
					"source" : [ "obj-89", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 1 ],
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-34" : [ "Tongue Index", "t_index", 0 ],
			"obj-35" : [ "Tongue Diameter", "t_dia", 0 ],
			"obj-37" : [ "Constriction Index", "c_index", 0 ],
			"obj-39" : [ "Constriction Diameter", "c_dia", 0 ],
			"obj-44" : [ "Lip Diameter", "lip_dia", 0 ],
			"obj-50" : [ "Tract Length (n)", "Tract_N", 0 ],
			"parameterbanks" : 			{
				"0" : 				{
					"index" : 0,
					"name" : "",
					"parameters" : [ "-", "-", "-", "-", "-", "-", "-", "-" ]
				}

			}
,
			"inherited_shortname" : 1
		}
,
		"dependency_cache" : [ 			{
				"name" : "MPT_Voice.maxpat",
				"bootpath" : "~/Projects/Max-Pink-Trombone",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "TractUI.js",
				"bootpath" : "~/Projects/Max-Pink-Trombone",
				"patcherrelativepath" : ".",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "getFrame.js",
				"bootpath" : "~/Projects/Max-Pink-Trombone",
				"patcherrelativepath" : ".",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "glottis_processor.gendsp",
				"bootpath" : "~/Projects/Max-Pink-Trombone",
				"patcherrelativepath" : ".",
				"type" : "gDSP",
				"implicit" : 1
			}
, 			{
				"name" : "tract_processor.gendsp",
				"bootpath" : "~/Projects/Max-Pink-Trombone",
				"patcherrelativepath" : ".",
				"type" : "gDSP",
				"implicit" : 1
			}
 ],
		"autosave" : 0,
		"styles" : [ 			{
				"name" : "rnbodefault",
				"default" : 				{
					"accentcolor" : [ 0.343034118413925, 0.506230533123016, 0.86220508813858, 1.0 ],
					"bgcolor" : [ 0.031372549019608, 0.125490196078431, 0.211764705882353, 1.0 ],
					"bgfillcolor" : 					{
						"angle" : 270.0,
						"autogradient" : 0.0,
						"color" : [ 0.031372549019608, 0.125490196078431, 0.211764705882353, 1.0 ],
						"color1" : [ 0.031372549019608, 0.125490196078431, 0.211764705882353, 1.0 ],
						"color2" : [ 0.263682, 0.004541, 0.038797, 1.0 ],
						"proportion" : 0.39,
						"type" : "color"
					}
,
					"color" : [ 0.929412, 0.929412, 0.352941, 1.0 ],
					"elementcolor" : [ 0.357540726661682, 0.515565991401672, 0.861786782741547, 1.0 ],
					"fontname" : [ "Lato" ],
					"fontsize" : [ 12.0 ],
					"stripecolor" : [ 0.258338063955307, 0.352425158023834, 0.511919498443604, 1.0 ],
					"textcolor_inverse" : [ 0.968627, 0.968627, 0.968627, 1 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "rnbomonokai",
				"default" : 				{
					"accentcolor" : [ 0.501960784313725, 0.501960784313725, 0.501960784313725, 1.0 ],
					"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgfillcolor" : 					{
						"angle" : 270.0,
						"autogradient" : 0.0,
						"color" : [ 0.0, 0.0, 0.0, 1.0 ],
						"color1" : [ 0.031372549019608, 0.125490196078431, 0.211764705882353, 1.0 ],
						"color2" : [ 0.263682, 0.004541, 0.038797, 1.0 ],
						"proportion" : 0.39,
						"type" : "color"
					}
,
					"clearcolor" : [ 0.976470588235294, 0.96078431372549, 0.917647058823529, 1.0 ],
					"color" : [ 0.611764705882353, 0.125490196078431, 0.776470588235294, 1.0 ],
					"editing_bgcolor" : [ 0.976470588235294, 0.96078431372549, 0.917647058823529, 1.0 ],
					"elementcolor" : [ 0.749019607843137, 0.83921568627451, 1.0, 1.0 ],
					"fontname" : [ "Lato" ],
					"locked_bgcolor" : [ 0.976470588235294, 0.96078431372549, 0.917647058823529, 1.0 ],
					"stripecolor" : [ 0.796078431372549, 0.207843137254902, 1.0, 1.0 ],
					"textcolor" : [ 0.129412, 0.129412, 0.129412, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
 ]
	}

}
