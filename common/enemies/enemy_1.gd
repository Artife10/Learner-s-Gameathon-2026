extends CharacterBody2D

const DATA = preload("uid://dah60hxoroth1")

const SPEED = 100.0
const ACCEL = 10.0

var player : CharacterBody2D
var hp = 10.0

func _ready() -> void:
	player = get_tree().current_scene.find_child("Player")

var directiony = 0
var directionx = 0
func _physics_process(delta: float) -> void:
	
	if 0 >= hp:
		var data = DATA.instantiate()
		add_sibling(data)
		data.global_position = global_position
		queue_free()
	
	if player.global_position.y > global_position.y:
		directiony = 1
	elif global_position.y > player.global_position.y:
		directiony = -1
	else:
		directiony = 0
	
	if player.global_position.x > global_position.x:
		directionx = 1
	elif global_position.x > player.global_position.x:
		directionx = -1
	else:
		directionx = 0
	
	if SPEED > abs(velocity.x):
		velocity.x += directionx * ACCEL
	if SPEED > abs(velocity.y):
		velocity.y += directiony * ACCEL
	velocity.x = move_toward(velocity.x, 0, ACCEL/2)
	velocity.y = move_toward(velocity.y, 0, ACCEL/2)

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Projectile"):
		hp-= body.GetDam()
		velocity = - global_position.direction_to(player.global_position) * SPEED
		body.queue_free()
