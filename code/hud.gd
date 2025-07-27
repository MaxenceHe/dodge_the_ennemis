extends CanvasLayer

signal start_game

func show_message(text) :
	$Message.text = text
	$Message.show()
	$Message_Timer.start()


func show_game_over() :
	show_message("GAME OVER")
	await $Message_Timer.timeout
	
	$Message.text = "DODGE THE ENNEMIES!"
	$Message.show()
	
	await  get_tree().create_timer(1.0).timeout
	$Start_Button.show()
	$tree1.show()
	$tree2.show()


func update_score(score) :
	$Score_label.text = str(score)


func _on_start_button_pressed() -> void:
	$Start_Button.hide()
	$tree1.hide()
	$tree2.hide()
	start_game.emit()


func _on_message_timer_timeout() -> void:
	$Message.hide()
