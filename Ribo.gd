extends KinematicBody2D

const SPEED := 400.0


func _process(delta: float) -> void:
	var direction:= Input.get_vector("ui_left",
	"ui_right","ui_up","ui_down")
	var velocity:= direction*SPEED
	move_and_slide(velocity,Vector2(0,0), false, 4, PI / 4, false)
