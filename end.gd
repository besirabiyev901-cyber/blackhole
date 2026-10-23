extends Node
@onready var animator = $"../HouseScene/AudioStreamPlayer2D/AnimationPlayer"
signal privet
@onready var sender = $"../Outside"

func _ready() -> void:
	sender.connect("davay2",_coco)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		animator.play("perexod2")
		emit_signal("privet")

func _coco():
	$"../AudioStreamPlayer2".stop()
	$"../AudioStreamPlayer3".play()
	


func _on_area_2d_4_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://scenes/cutscene.tscn")
