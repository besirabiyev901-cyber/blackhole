extends Control
func _ready() -> void:
	$AnimationPlayer.play("cutsecene")
	await $AnimationPlayer.animation_finished
	await get_tree().create_timer(5).timeout
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
