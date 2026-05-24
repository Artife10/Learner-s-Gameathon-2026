extends CharacterBody2D
@onready var body: AnimatedSprite2D = $Body


const SPEED = 300.0
const DECEL = 10.0
const ACCEL = 20.0

var data_counter = 0
@export var data_label : Label


func _physics_process(delta: float) -> void:

	var directionx := Input.get_axis("left", "right")
	var directiony := Input.get_axis("up", "down")
	if directionx or directiony:
		if directiony > 0:
			body.play("Move")
		elif 0 > directiony:
			body.play("MoveBackwards")
		else:
			body.play("Move")
		if directionx:
			body.scale.x = directionx
		if SPEED > abs(velocity.x):
			velocity.x += directionx * ACCEL
		if SPEED > abs(velocity.y):
			velocity.y += directiony * ACCEL
	else:
		body.play("Idle")
	velocity.x = move_toward(velocity.x, 0, DECEL)
	velocity.y = move_toward(velocity.y, 0, DECEL)

	move_and_slide()

func add_count(data_count: int) -> void:
	data_counter += data_count
	data_label.text = "DATA: " + str(data_counter)
