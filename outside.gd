extends Node
signal davay2
@onready var animator = $"../HouseScene/AudioStreamPlayer2D/AnimationPlayer"
@onready var sender = $"../Telephone"
func _ready() -> void:
	sender.connect("davay",_pepe)
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		animator.play("transition")
		animator.play("perexod2")
		
func _pepe():
	$"../AudioStreamPlayer2".play()
	emit_signal("davay2")
