extends Node

#Agressive AI 
#Behavior: Aggressive:

#Default: moves towards nearby objects.

#On touch: moves faster towards nearby objects.


var maxSpeedValue = 2

var speedDirection = Vector2(0,1)
var speedValue = 2
var speedVector = Vector2(0,0)


var des
var tmp
var tmp1

#State 0: wandering - 1:moving to destination
var state = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	# 
	pass

#MANDATORY FUNCTION-BEGIN----------------------
func update( body):
	#Check if targetList exist in body
	if !("targetList" in body):#If targetList is not in body, do nothing
		return
	if body.targetList.size >0:#If body detect one or more nearby object, move to the nearest object
		moveToNearestTarget(body)
	if body.targetList.size ==0:#If there are no object detect, wander randomly
		wanderRandomly( body)
	
	pass

func unhandled_input(ev):
	
	#change state
	state = 1
	#Set destination
	des = ev
	
	pass

#MANDATORY FUNCTION-END--------------------------

func moveToNearestTarget(body):
	#Set the current nearest as the first target
	des = body.targetList[0]
	#Check which is the nearest target
	for i in body.targetList:
		#Get the vector between body and the target i
		tmp = i.get_global_pos() - body.get_global_pos()
		#Get the vector betwwen body and the current nearest target
		tmp1 = des - body.get_global_pos()
		#Compare distance
		if tmp.length() < tmp1.length():#If the distance of i is shorter, set i position as des
			des = i.get_global_pos()
	#Move body to the neaest target
	moveToTarget(des, body)
	pass

func moveToTarget(des, body):
	
	tmp = des - body.get_global_pos()
	#Set speed
	speedValue = maxSpeedValue
	
	#Calculate distance
	if tmp.length() <= speedValue || des ==null: #If des reached, back to wandering mode
		print("STOPPP")
		state = 0
		speedValue = 0
		des = null
		return
	#Calculate direction
	speedDirection = tmp.normalized()
	#Move target to des
	speedVector = speedDirection * speedValue
	body.set_global_pos( body.get_global_pos() + speedVector)
	pass



func wanderRandomly(body):
	#random change direction
	tmp = rand_range(0, 999)
	
	#Calculate action
	if  0 <tmp && tmp < 2:
		#Change direction
		speedDirection = speedDirection.rotated(rand_range(0, 314) /100)
		print("Directino change")
	if 10 < tmp && tmp< 20 :
		#Change speed
		speedValue = maxSpeedValue
		print("Speed change")
		
	if 30< tmp && tmp <50 :
		#Stop
		speedValue = 0
		
	if 50< tmp && tmp < 100:
		#No change
		pass 
	
	#Moving body
	speedVector = speedDirection * speedValue
	body.set_global_pos( body.get_global_pos() + speedVector)
	pass
