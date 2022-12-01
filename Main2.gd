extends Node2D

export (PackedScene) var aac_scene

var list_colors:=[Color("e1162ac7"),Color("e1c80aa2"),Color("e10ac811")]

var flag :=false

func ready()->void:
	randomize()


func _on_Timer_timeout() -> void:
	if flag:
		var spawn_loc = $Path2D/SpawnPath
		spawn_loc.unit_offset=randi()
		var aac=aac_scene.instance()
		add_child(aac)
		aac.aac_color_id()
		aac.position= spawn_loc.position
		var direction= rand_range(-PI,PI)
		var velocity = Vector2(300,0)
		aac.linear_velocity=velocity.rotated(direction)

