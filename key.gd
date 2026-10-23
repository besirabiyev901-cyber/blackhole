extends Node2D

signal block_off
func _on_key_detector_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		emit_signal("block_off")
		$door_open.play()
		await get_tree().create_timer(0.5).timeout
		queue_free()
