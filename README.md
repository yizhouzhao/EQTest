# EQTest: Learning to Act: A Social Relational Perspective

## Maya Command
新建场景： file -f -new;

导入FBX模型 FBXImport -file "<file_name>";

获取时间轴时间区间 float $minTime = `playbackOptions -q -minTime`; 
float $maxTime = `playbackOptions -q -maxTime`;

获取选取对象：ls -sl;
清楚关键帧：cutKey -cl;

重置关节：
import maya.cmds as cmds

objs = cmds.ls(selection=True)

cmds.setAttr(objs[0] + ".translateX", 0)
cmds.setAttr(objs[0] + ".translateY", 0)
cmds.setAttr(objs[0] + ".translateZ", 0)

cmds.setAttr(objs[0] + ".rotateX", 0)
cmds.setAttr(objs[0] + ".rotateY", 0)
cmds.setAttr(objs[0] + ".rotateZ", 0)

cmds.cutKey(objs[0], clear=True)

重命名blendshape

import maya.cmds

def rename_morph_targets( node_name, attr_dict, quiet = False ):
	# list to catch our failures	
	fail_list = [ ]

	# How many targets there are in the alias list
	number_of_targets = maya.cmds.getAttr( '{0}.weight'.format( node_name ), size = True )

	# Iterate through the weight list
	for index in range( 0, number_of_targets ):
		# Query the name of the current blendshape weight
		old_name = maya.cmds.aliasAttr( '{0}.weight[{1}]'.format( node_name, index ), query = True )

		# If the old name isn't in the attr_dict, we're going to pass on it.
		if old_name in attr_dict.keys( ):
			# We're going to rename
			new_name = attr_dict[ old_name ]
			print 'Found old name: ', index, new_name, old_name
			
			absolute_name = '{0}.weight[{1}]'.format( node_name, index )

			maya.cmds.aliasAttr( new_name, absolute_name ) # Re-aliasing / Renaming occurs here.
			if not quiet:
				print 'Changed {0} -> {1}'.format( old_name, new_name )
				
		# Add the failure to the fail list		
		else:
			fail_list.append( old_name )

	if fail_list:
		maya.cmds.warning( '{0} names were not changed. Check console for details'.format( len( fail_list ) ) )
		for name in fail_list:
			print name

###################
## Example Usage ##
###################
	
attr_dict = { 'GOZFBXASC032KAPA': 'panda1',
                 'GOZFBXASC032ALTI': 'panda2' }

node_name = "Morpher" # Name of the blendshape
rename_morph_targets( node_name, attr_dict )


## Maya

Advanced Skeleton

:watermelon: https://www.animationstudios.com.au/advanced-skeleton

:watermelon: :watermelon: Studio Library

https://www.studiolibrary.com/


## CG

:lollipop: :lollipop: CGMeetup

https://cgmeetup.com/gallery

:lollipop: Mixamo

https://www.mixamo.com/#/

## Reference

Animation Table List We made:

https://docs.google.com/spreadsheets/d/1cqOnrNEei4svSnzjlHBvAeipIB7iEeTPuA5l-f8Kop0/edit?usp=sharing

## Papers

 :octocat:  :octocat:  :octocat: Learning Social Affordance for Human-Robot Interaction
 
https://www.ijcai.org/Proceedings/16/Papers/488.pdf

 :octocat:  :octocat: Hierarchical Recurrent Neural Network for Skeleton Based Action Recognition
 
 https://www.cv-foundation.org/openaccess/content_cvpr_2015/html/Du_Hierarchical_Recurrent_Neural_2015_CVPR_paper.html

 :octocat:  
 
 Two-person interaction detection using body-pose features and multiple instance learning

https://ieeexplore.ieee.org/abstract/document/6239234?casa_token=n4GS_Ul5V2UAAAAA:4BAF3Ejaf0xXOc-jhd0LmWFHCgkp4YLuDf5ar3b1k7l2wyvLYcNnwB9mT4bzkzxBXzEIr0ePaQ7I
