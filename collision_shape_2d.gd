#extends CollisionShape2D
#
#
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
extends CharacterBody2D

const SPEED = 400.0

func _physics_process(delta):
	# Pobieranie kierunku z klawiszy strzałek (lub A/D)
	var direction = Input.get_axis("ui_left", "ui_right")
	
	# Ustawienie prędkości poziomej
	velocity.x = direction * SPEED
	
	# Ruch i uwzględnianie kolizji
	move_and_slide()
