extends Control


@onready var firstButton = $JumpIndicatorPanel/Button
@onready var secondButton = $JumpIndicatorPanel2/Button
@onready var thirdButton = $JumpIndicatorPanel3/Button
@onready var timer = $Timer
@onready var indicators_active = 3

signal jump_indicator_refreshed(jumps: int)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func can_jump() -> bool:
	return firstButton.visible

func indicator_timer():
	var refreshed : bool = false
	
	if(!firstButton.visible):
		firstButton.visible = true
		refreshed = true
		indicators_active += 1
		
	elif(!secondButton.visible):
		secondButton.visible = true
		refreshed = true
		indicators_active += 1
		
	elif(!thirdButton.visible):
		thirdButton.visible = true
		refreshed = true
		indicators_active += 1
	
	
	if(refreshed):
		emit_signal("jump_indicator_refreshed", indicators_active)
		

func decrement_indicators():
	var has_decremented : bool = false
	# buttons needs to go 3 -> 1
	if(thirdButton.visible):
		thirdButton.visible = false
		has_decremented = true
	elif(secondButton.visible):
		secondButton.visible = false
		has_decremented = true
	elif(firstButton.visible):
		firstButton.visible = false
		has_decremented = true
	
	if(has_decremented):
		indicators_active -= 1
		emit_signal("jump_indicator_refreshed", indicators_active)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


