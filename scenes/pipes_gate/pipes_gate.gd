extends Node2D


const SCROLL_SPEED: float = 120.0

var score: int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= SCROLL_SPEED * delta


func _on_screen_exited():
	queue_free()


#func _on_pipe_body_entered(body):
	#print(body)
	#queue_free()
#
#
#func _on_laser_body_exited(body):
	#print(body)
	#score += 1
	#print("SCORE: {score}")
