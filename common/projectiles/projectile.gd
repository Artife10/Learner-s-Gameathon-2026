extends CharacterBody2D
class_name projectile
@export var SPRITE : Sprite2D


@export var target : Vector2
@export var start : Vector2

@export var damage : float
@export var speed : float

@export var sprite : Texture2D

@export var col : Area2D

var finished = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SPRITE.texture = sprite

func _physics_process(delta: float) -> void:
	if finished:
		move_and_slide()

func Shoot(target : Vector2, start : Vector2, damage : float, speed : float):
	target = target
	start = start
	damage = damage
	speed = speed
	global_position = start
	velocity = speed * global_position.direction_to(target)
	finished = true

func GetDam():
	return damage
