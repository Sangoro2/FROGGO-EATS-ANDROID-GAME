extends CharacterBody2D


const SPEED = 25.0
const JUMP_VELOCITY = -400.0

@onready var animation = $AnimationPlayer
@onready var timer = $Timer

var rng = RandomNumberGenerator.new()



# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	timer.connect("timeout", set_rand_vel)
	set_rand_vel()
	animation.play("Idle")
	timer.start()
	
func set_rand_vel():
	velocity.y = rng.randi_range(-3, 3) * SPEED

	velocity.x = rng.randi_range(-3, 3) * SPEED

	print("x vel: " + str(velocity.x)+ " - y vel: " + str(velocity.y))


func _physics_process(delta):
	

	move_and_slide()
