extends Node2D
@onready var doorb = $doorb
@onready var doorb_block = $StaticBody2D/CollisionShape2D
var block_active = false
@onready var txt = $Label
@onready var signal_sender = $"../Key"
@onready var block = $"../Block/StaticBody2D"
func _ready() -> void:
	signal_sender.connect("block_off",araz)
	txt.visible = false

func araz():
	block_active = true

func _on_doorb_detector_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and block_active == true:
		doorb.modulate.a = 0.5
		doorb_block.set_deferred("disabled",true)


func _on_doorb_detector_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player") and block_active == true:
		doorb.modulate.a = 1


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		txt.visible = true
		block.queue_free()
		await get_tree().create_timer(1).timeout
		$Area2D.queue_free()
