extends CharacterBody2D

const SPEED = 600.0
const JUMP_VELOCITY = -400.0
@onready var animation = $AnimationPlayer
@onready var current_direction = 0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	animation.play("player_idle")

func _physics_process(delta):

	if not is_on_floor():
		velocity.y += gravity * 2 * delta
		velocity.x += current_direction * SPEED * delta
	
	if(is_on_floor() and velocity.y == 0):
		current_direction = 0
		velocity.x = 0
	move_and_slide()

func set_Direction_and_jump(direction):
	if(is_on_floor()):
		velocity.y = JUMP_VELOCITY
		current_direction = direction
