extends CharacterBody2D
@onready var body: AnimatedSprite2D = $Body


const SPEED = 300.0

var data_counter = 0
@onready var data_label = %Label


func _physics_process(delta: float) -> void:

	var directionx := Input.get_axis("left", "right")
	var directiony := Input.get_axis("up", "down")
	if directionx or directiony:
		if directionx:
			body.scale.x = directionx
		velocity.x = directionx * SPEED
		velocity.y = directiony * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Data"):
		set_count(data_counter + 1)
		

func set_count(new_data_count: int) -> void:
	data_counter = new_data_count
	data_label.text = "DATA: " + str(data_counter)
