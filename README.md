level-generator-prototype
=========================

A random level generator, being developed for use in Project eXile.

In Project eXile, levels will be space stations similar to those in Space Station 13, with insular
departments, wide hallways, and snaking maintance corridors. 

Currently, the generator divides a 4 x 4 grid of "room slots" - called an area - into a series of rooms, 
each denoted by a different color. Room slots that appear black are those that were not selected.

This "area" is meant represent one department of a space station, like Engineering, Security, or the Medbay.

We intend to expand the generator to construct multiple areas connected by hallways and maintenance, generate
damage to the station (they're supposed to be abandoned), and populate it with loot and enemies. 

##INSTRUCTIONS:

  ###OPTION 1 :
  run the included executable

  ###OPTION 2 :
  open the RandomGenTest.project file in Game Maker: Studio
  
  ###OPTION 3 : 
  import the included RandomGenTest.gmz file with Game Maker: Studio


##CONTROLS:

use ASDW keys to move around the area. 

Press R to generate a new area.

