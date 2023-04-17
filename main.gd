extends Node2D

const RIGHT_DIR = 1
const LEFT_DIR = -1

@onready var player = $Player
@onready var jumpIndicator = $JumpIndicatorPanel
@onready var indicator = 3;

signal jump_activated

# Called when the node enters the scene tree for the first time.
func _ready():
	jump_activated.connect(jumpIndicator.decrement_indicators)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_jump_indicator_panel_jump_indicator_refreshed(jumps):
	indicator = jumps
	print("Indicator refreshed!: " + str(indicator))

func _on_right_arrow_btn_pressed():
	if(jumpIndicator.can_jump()):
		player.set_Direction_and_jump(RIGHT_DIR)
		emit_signal("jump_activated")

func _on_left_arrow_btn_pressed():
	if(jumpIndicator.can_jump()):
		player.set_Direction_and_jump(LEFT_DIR)
		emit_signal("jump_activated")
