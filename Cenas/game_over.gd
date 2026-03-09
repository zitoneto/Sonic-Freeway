extends Control

func _on_quit_bttn_pressed() -> void:
	get_tree().quit()


func _on_restart_bttn_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/main.tscn")
