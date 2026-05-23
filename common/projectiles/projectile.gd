extends CharacterBody2D
class_name projectile
@export var SPRITE : Sprite2D


@export var target : Vector3
@export var start : Vector3

@export var damage : float
@export var speed : float

@export var sprite : ImageTexture


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SPRITE.texture = sprite


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
