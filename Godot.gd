extends Sprite

export (int) var speed = 200
export (float) var rotation_speed = 1.5

var velocity := Vector2()
var rotation_dir : float = 0
var target := Vector2()

func get_input_8way():
	velocity = Vector2.ZERO	
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1	
	velocity = velocity.normalized()
	print(velocity, velocity.length())

func get_input_rot():	
	rotation_dir = 0
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		rotation_dir += 1
	if Input.is_action_pressed("left"):
		rotation_dir -= 1
	if Input.is_action_pressed("down"):
		velocity = Vector2(0, 1).rotated(rotation)
	if Input.is_action_pressed("up"):
		velocity = Vector2(0, -1).rotated(rotation)
	print(velocity)

func get_input_mouselook():
	look_at(get_global_mouse_position())
	rotation += deg2rad(90)
	velocity = Vector2()
	if Input.is_action_pressed("down"):
		velocity = Vector2(0, 1).rotated(rotation)
	if Input.is_action_pressed("up"):
		velocity = Vector2(0, -1).rotated(rotation)
		
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		target = get_global_mouse_position()
		print(target)
		
func _physics_process(delta):
	print(delta)
	#get_input_rot()
	#get_input_mouselook()
	velocity = position.direction_to(target)
	#rotation += rotation_dir * rotation_speed * delta
	if position.distance_to(target) > 5:
		position += velocity * speed * delta
