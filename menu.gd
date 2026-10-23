extends Control

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/house_scene_controller.tscn")


func _on_button_2_pressed() -> void:
	get_tree().quit()





func _on_button_mouse_entered() -> void:
	var tween: Tween = get_tree().create_tween()
	tween.set_parallel(false)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.tween_property($Button, "scale", Vector2(1,1), 0.4)
	tween.tween_property($Button, "scale", Vector2(0.9,0.9), 0.1)
	tween.tween_property($Button, "scale", Vector2(1.1,1.1), 0.2)
	tween.play()
	await tween.finished


func _on_button_2_mouse_entered() -> void:
	var tween: Tween = get_tree().create_tween()
	tween.set_parallel(false)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.tween_property($Button2, "scale", Vector2(1,1), 0.4)
	tween.tween_property($Button2, "scale", Vector2(0.9,0.9), 0.1)
	tween.tween_property($Button2, "scale", Vector2(1.1,1.1), 0.2)
	tween.play()
	await tween.finished
