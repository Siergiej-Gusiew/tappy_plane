extends ParallaxBackground


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_plane_crushed.connect(_on_plane_crushed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_offset.x -= GameManager.SCROLL_SPEED * delta


func _on_plane_crushed():
	set_process(false)
