extends Node
signal main_sound
signal davay
@onready var animator = $"../HouseScene/AudioStreamPlayer2D/AnimationPlayer"
@onready var block = $StaticBody2D
@onready var bg = $ColorRect


func _ready() -> void:
	bg.visible = false

func _on_telephone_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		$StaticBody2D/CollisionShape2D.set_deferred("disabled",true)
		$AudioStreamPlayer2D.play()
		animator.play("ou")
		await get_tree().create_timer(1).timeout
		$"../Telephone_area/CollisionShape2D".set_deferred("disabled",true)
		emit_signal("main_sound")




func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		emit_signal("davay")
		bg.visible = true
		animator.play("peroxod")
		await animator.animation_finished
		bg.visible = false
