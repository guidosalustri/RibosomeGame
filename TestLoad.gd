extends Node2D

onready var input_ARN:=$RNAInput/HBoxContainer/LineEdit
onready var b:=$RNAInput/HBoxContainer/Button
#export (PackedScene) var mj_scene
#onready var mj_scene := preload("Mensajero.tscn")

func _ready() -> void:
	b.connect("pressed", self,"_on_Button_pressed")


func _process(delta: float) -> void:
	
	print(b.is_connected("pressed", self,"_on_Button_pressed"))

func _on_Button_pressed()->void:
	#print(input_ARN.text)
	var mj_scene := preload("Mensajero.tscn")
	var mj=mj_scene.instance()
	mj.transcript=input_ARN.text
	add_child(mj)

	var ribo_scene := preload("Ribo.tscn")
	var ribo=ribo_scene.instance()
	var sub2 :Node2D=ribo.get_children()[1]
	sub2.ls_m=mj.ls_nuc
	add_child(ribo)

	$RNAInput.hide()

