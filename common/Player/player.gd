extends CharacterBody2D
@onready var body: AnimatedSprite2D = $Body
@onready var frate: Timer = $Frate
const PROJECTILE_1 = preload("uid://7a4845jfiqav")

var SPEED = 300.0
const DECEL = 10.0
var ACCEL = 20.0

var CanBoost = true

var data_counter = 0
@export var data_label : Label


func _physics_process(delta: float) -> void:
	if frate.is_stopped():
		var bullet = PROJECTILE_1.instantiate()
		self.get_parent().add_child(bullet)
		bullet.Shoot(get_global_mouse_position(), global_position, 1.5, 500.0)
		frate.start()
	
	

	var directionx := Input.get_axis("left", "right")
	var directiony := Input.get_axis("up", "down")
	
	if Input.is_action_just_pressed("boost"):
		if CanBoost:
			CanBoost = false
			SPEED = SPEED*2
			ACCEL = ACCEL*2
			await get_tree().create_timer(0.5).timeout
			SPEED = 300
			ACCEL = 20.0
			get_tree().create_timer(5).timeout.connect(func(): CanBoost = true)
		
	
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
