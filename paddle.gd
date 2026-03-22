extends CharacterBody2D

const SPEED = 400.0
var start_y: float = 0.0

func _ready():
	# Zapisujemy pozycję Y paletki w momencie startu gry
	start_y = global_position.y

func _physics_process(delta):
	# Pobieranie kierunku (lewo/prawo)
	var direction = Input.get_axis("ui_left", "ui_right")
	
	# Ustawienie prędkości poziomej i wyzerowanie pionowej
	velocity.x = direction * SPEED
	velocity.y = 0 
	
	# Ruch fizyczny
	move_and_slide()
	
	# Twarde wymuszenie: zawsze trzymaj paletkę na początkowej wysokości!
	global_position.y = start_y
