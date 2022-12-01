extends RigidBody2D

onready var time:=$Timer
onready var area_aac:=$Area2D

var list_colors:=[[Color("e1162ac7"),"A"],[Color("e1c80aa2"),"R"],[Color("e10ac811"),"K"],[Color("1eb59d"),"S"]]

func _ready() -> void:
	set_bounce(1)
	randomize()


func _on_Timer_timeout() -> void:
	if area_aac.monitorable==true:
		queue_free()

func aac_color_id()-> void:
	var index:= randi()%list_colors.size()
	$Sprite.modulate=list_colors[index][0]
	$Node2D/Label.text=list_colors[index][1]

