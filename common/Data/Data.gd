extends Area2D
@onready var data: Node2D = $".."


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.add_count(1)
		queue_free()
