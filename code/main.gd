extends Node

@export var mob_scene : PackedScene
var score

func _ready() -> void:
	pass
	# new_game()



func game_over() -> void:
	$Music.stop()
	$Game_over_sound.play()
	$Score_Timer.stop()
	$Mob_Timer.stop()
	$HUD.show_game_over()

func new_game():
	$Music.play()
	score = 0
	$Player.start($Start_Position.position)
	$Start_Timer.start()
	$HUD.update_score(score)
	$HUD.show_message("GET READY!")


func _on_start_timer_timeout() -> void:
	$Mob_Timer.start()
	$Score_Timer.start()


func _on_score_timer_timeout() -> void:
	score += 1
	$HUD.update_score(score)


func _on_mob_timer_timeout() -> void:
	var mob = mob_scene.instantiate()
	
	var mob_spawn_location = get_node("Mob_Path/Mob_spawn_location")
	mob_spawn_location.progress_ratio = randf()
	
	var direction = mob_spawn_location.rotation + PI / 2;
	
	mob.position = mob_spawn_location.position;
	
	var velocity = Vector2(randf_range(150.0 , 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	
	add_child(mob)
