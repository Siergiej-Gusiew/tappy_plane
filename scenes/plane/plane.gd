extends CharacterBody2D


#signal on_plane_crushed

@onready var engine_sound = $EngineSound
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer

const GRAVITY: float = 1500.0
const POWER: float = -425.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	fly(delta)
	move_and_slide()
	if is_on_floor():
		game_over()
	
func fly(delta: float) -> void:
	velocity.y += GRAVITY * delta
	if Input.is_action_just_pressed("fly"):
		velocity.y = POWER
		animation_player.play("power")

func game_over() -> void:
	animated_sprite_2d.stop()
	engine_sound.stop()
	set_physics_process(false)
	SignalManager.on_plane_crushed.emit()
