extends Node2D

@onready var door = $Door
@onready var door_block: CollisionShape2D = $Door_Block/CollisionShape2D
@onready var text = $Label
@onready var door_sound = $Door_open_sound
var mojno = false

func _ready() -> void:
	text.visible = false

var open := false
var player_inside := false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and player_inside:
		open = true
		door_block.set_deferred("disabled", true)
		door.modulate.a = 0.5
		door_sound.play()

func _on_door_detector_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_inside = true
		text.visible = true


func _on_door_detector_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		text.visible = false
		player_inside = false
