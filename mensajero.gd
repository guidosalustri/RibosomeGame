extends Node2D


export (PackedScene) var nuc_scene

const DIC:={"A":Color("e1162ac7"),"U":Color("e1c80aa2"),"G":Color("e10ac811"),"C":Color("1eb59d")}

var transcript:String
var ls_nuc:=[]



func _ready() -> void:
	var nuc:Node2D=null
	for k in len(transcript):
		nuc=nuc_scene.instance()
		add_child(nuc)
		nuc.modulate=DIC[transcript[k]]
		ls_nuc.append(nuc)
	var inicial_pos:=Vector2(900,500)
	for i in ls_nuc:
		i.global_position=inicial_pos
		inicial_pos+=Vector2(35,0)
