
var name = "Default" #(user-given during Create/Edit)
var shape = "Default" #(square/rect, circle/oval, etc)
var color = "Default"
var personality = "Default" #/behavior (#10)
var id = "Default" #unique identifying number
var location = "Default" #(x and y coordinates)
var age = "Default" #(time since creation)
var origin = "Default" #(objected created by)



func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func setStat(stat):
	if "name" in  stat:
		name = stat.name
	
	if "shape" in stat:
		shape = stat.shape
	
	if "color" in stat:
		color = stat.color
	
	if "personality" in  stat:
		personality = stat.personality
	
	if "id" in stat:
		id = stat.id
	
	if "location" in stat:
		location = stat.location
	
	if "age" in stat:
		age = stat.age
	
	if "origin" in stat:
		origin = stat.origin
	pass