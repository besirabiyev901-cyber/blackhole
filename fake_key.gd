extends Node2D

@onready var fake_key = $faake_key_sprite
@onready var animator = $"../HouseScene/AudioStreamPlayer2D/AnimationPlayer"
@onready var block = $StaticBody2D
func _on_fake_key_detector_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		fake_key.modulate.a = 0
		animator.play("fake_key")
		await animator.animation_finished
		$StaticBody2D.queue_free()
		$AudioStreamPlayer2D.play()
		$fake_key_detector.queue_free()
