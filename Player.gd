extends KinematicBody2D

export var run_speed = 350
export var jump_speed = -1000
export var gravity = 2500

var velocity = Vector2()
onready var sprite := $SimplePlayer

func get_input():
	#velocity.x = 0
	velocity.x = Input.get_action_strength("right")-Input.get_action_strength("left")
	velocity.y = Input.get_action_strength("down")-Input.get_action_strength("up")
	#var jump = Input.is_action_just_pressed('ui_select')

	velocity *= run_speed
	
	if velocity.y > 0:
		sprite.play("down")
	elif velocity.y < 0:
		sprite.play("up")
	elif velocity.x > 0:
		sprite.play("right")
	elif velocity.x < 0:
		sprite.play("left")
	else:
		sprite.stop()
		sprite.frame = 0
	
	#if is_on_floor() and jump:
	#	velocity.y = jump_speed
	#if right:
	#	velocity.x += run_speed
	#if left:
	#	velocity.x -= run_speed

func get_input_side():
	#velocity.x = 0
	velocity.x = Input.get_action_strength("right")-Input.get_action_strength("left")
#	velocity.y = Input.get_action_strength("down")-Input.get_action_strength("up")
	#var jump = Input.is_action_just_pressed('ui_select')

	velocity.x *= run_speed
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_speed
	
	if velocity.x > 0:
		sprite.play("right")
	elif velocity.x < 0:
		sprite.play("left")
	else:
		sprite.stop()
		sprite.frame = 0
		
func _physics_process(delta):
	velocity.y += gravity * delta
	get_input_side()
	velocity = move_and_slide(velocity, Vector2.UP)


func _on_Area2D_body_entered(body: Node) -> void:
	print("Saiu da tela")
