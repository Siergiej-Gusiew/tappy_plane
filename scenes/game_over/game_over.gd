extends Control


@onready var game_over_label = $GameOverLabel
@onready var space_label = $SpaceLabel
@onready var timer = $Timer
@onready var crush_sound = $CrushSound


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	space_label.hide()
	SignalManager.on_plane_crushed.connect(_on_plane_crushed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if space_label.visible and Input.is_action_just_pressed("fly"):
		GameManager.load_main_scene()
	
	
func run_sequence() -> void:
	game_over_label.hide()
	space_label.show()


func _on_plane_crushed() -> void:
	crush_sound.play()
	show()
	timer.start()


func _on_timer_timeout():
	run_sequence()
