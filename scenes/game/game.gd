extends Node2D

var spawn_range_min = 225
var spawn_range_max = 425
var score: int = 0

@export var pipes_scene: PackedScene

@onready var pipes_holder = $pipes_holder
@onready var spawn_timer = $spawn_timer

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	spawn_pipes()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawn_pipes() -> void:
	var new_pipes = pipes_scene.instantiate()
	var pos_y = randf_range(spawn_range_min, spawn_range_max)
	new_pipes.position = Vector2(1250, pos_y)
	pipes_holder.add_child(new_pipes)


func stop_pipes() -> void:
	spawn_timer.stop()
	for pipe in pipes_holder.get_children():
		pipe.set_process(false)


func _on_spawn_timer_timeout():
	spawn_pipes()


func _on_plane_crushed():
	stop_pipes()
	# TODO: paste here plane crush animation or scene!
