extends Control

onready var butt:=$HBoxContainer/Button

func _input(event):
		if Input.is_action_just_pressed("ui_accept"):
			butt.grab_focus()
			butt.pressed = true
