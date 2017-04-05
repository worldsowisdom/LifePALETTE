extends Node

#Default AI 
#Behavior: moving random

var maxSpeedValue = 2

var speedDirection = Vector2(0,1)
var speedValue = 2
var speedVector = Vector2(0,0)


var des
var tmp

#State 0: wandering - 1:moving to destination
var state = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func update( body):
	
	if state == 0:
		wanderRandomly(body)
	if state == 1:
		moveToTarget(des, body)
	
	pass

func unhandled_input(ev):
	
	#change state
	state = 1
	#Set destination
	des = ev
	
	pass

func moveToTarget(des, body):
	
	tmp = des - body.get_global_pos()
	#Set speed
	speedValue = maxSpeedValue
	
	#Calculate distance
	if tmp.length() <= speedValue || des ==null: #If des reached, back to wandering mode
		
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
		
	if 10 < tmp && tmp< 20 :
		#Change speed
		speedValue = maxSpeedValue
		
		
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