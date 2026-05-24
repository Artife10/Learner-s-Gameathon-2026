extends Node2D
@onready var timer: Timer = $Timer
const ENEMY_1 = preload("uid://lm4vr6dr2r1a")

var enemycount = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if timer.is_stopped():
		for i in range(enemycount):
			var enemy = ENEMY_1.instantiate()
			
			enemy.global_position = Vector2(
				global_position.x + randf_range(300, 900) * Choose(-1, 1),
				global_position.y + randf_range(300, 900) * Choose(-1, 1)
			)
			
			get_parent().add_sibling(enemy)
		enemycount+=1
		timer.wait_time = timer.wait_time * 0.9
		timer.start()

func Choose(num1, num2):
	var rnd = randf_range(-5, 5)
	
	if rnd > 0:
		return num1
	else:
		return num2
