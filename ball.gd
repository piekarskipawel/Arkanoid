#extends CharacterBody2D
#
#
#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
#
#
#func _physics_process(delta: float) -> void:
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
	
extends CharacterBody2D

var speed = 350.0
# Wektor początkowego lotu: w prawo i w górę
var direction = Vector2(1, -1).normalized() 

func _physics_process(delta):
	# move_and_collide zwraca informacje o kolizji, jeśli taka nastąpi
	var collision = move_and_collide(direction * speed * delta)
	
	if collision:
		# Odbijanie wektora kierunku na podstawie wektora normalnego ściany/obiektu
		direction = direction.bounce(collision.get_normal())
		
		# Pobranie obiektu, w który uderzyła piłka
		var collider = collision.get_collider()
		
		# Sprawdzenie, czy obiekt jest klockiem
		if collider.is_in_group("Bricks"):
			collider.queue_free() # Zniszczenie klocka
