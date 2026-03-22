extends Node2D

# Zmienna zapobiegająca ciągłemu wywoływaniu wygranej
var game_won = false

func _process(delta):
	# Sprawdzamy, czy gra nie jest jeszcze wygrana i czy liczba klocków spadła do zera
	if not game_won and get_tree().get_nodes_in_group("Bricks").size() == 0:
		game_won = true
		$WinUI.show() # Pokazuje ekran wygranej
		get_tree().paused = true # Zatrzymuje całą grę (piłkę, paletkę)

func _on_death_zone_body_entered(body):
	if body.name == "Ball":
		get_tree().reload_current_scene()

func _on_button_pressed():
	# NAJPIERW musimy wyłączyć pauzę, inaczej zrestartowana gra nadal będzie zamrożona!
	get_tree().paused = false 
	
	# Przeładowanie sceny (restart)
	get_tree().reload_current_scene()
