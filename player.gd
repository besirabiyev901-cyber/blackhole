extends CharacterBody2D

@export var speed = 250
@onready var player = $"Player-sprite"
var dir = 0
@onready var steps_on_wood = $"steps_on-wood"
var block = true
@onready var begining_anim = $"../HouseScene/AudioStreamPlayer2D/AnimationPlayer"
@onready var window_open_sound = $"../window/window_open_sound"
@onready var sender = $"../Telephone"
@onready var sender2 = $"../END"
##################################################################################################

func _ready() -> void:
	begining_anim.play("beginining")
	await begining_anim.animation_finished
	block = false
	sender.connect("main_sound",_faa)
	sender2.connect("privet",_byali)
	$Label.visible = false

func get_input():
	var input_direction = Input.get_vector("left","right","up","down")
	velocity = input_direction * speed
	if Input.is_action_pressed("right") and input_direction.x > 0:
		player.play("walk-right")
		player.flip_h = false
	elif Input.is_action_pressed("left") and input_direction.x < 0:
		player.play("walk-right")
		player.flip_h = true
	elif Input.is_action_pressed("up"):
		player.play("walk-up")
	elif Input.is_action_pressed("down"):
		player.play("walk-down")
	else:
		player.play("front-idle")
	if velocity.length() != 0:
		if !steps_on_wood.playing:
			steps_on_wood.pitch_scale = 2
			steps_on_wood.play()
	if velocity.length() == 0:
		steps_on_wood.stop()

##################################################################################################

func _physics_process(_delta):
	if block == false:
		get_input()
		move_and_slide()
	
	dir = Input.get_axis("left","right")
	if dir > 0:
		$"Player-polygon".visible = true
		$"Player-polygon2".visible = false
	if dir < 0:
		$"Player-polygon".visible = false
		$"Player-polygon2".visible = true

##################################################################################################

func _on_steponline_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		steps_on_wood = $"steps_on-line"

func _on_steponline_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		steps_on_wood = $"steps_on-wood"


###################################################################################################


func _on_window_detector_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		window_open_sound.play()
		begining_anim.play("window")
		block = true
		await begining_anim.animation_finished
		block = false
################################################################################################33
func _faa():
	$"../HouseScene/AudioStreamPlayer2D".stop()
	block = true
	$"../HouseScene/AudioStreamPlayer2D2".play()
	await get_tree().create_timer(2).timeout
	block = false


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		steps_on_wood = $"../AudioStreamPlayer"

func _byali():
	$Label.visible = true
