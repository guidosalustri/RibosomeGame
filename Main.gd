extends Node2D

export (PackedScene) var aac_scene


onready var input_ARN:=$RNAInput/HBoxContainer/LineEdit
onready var b:=$RNAInput/HBoxContainer/Button
onready var game_over:=$ColorRect
onready var flabel:=$ColorRect/ColorRect/VBoxContainer/FinalScore

var sub1:Node2D
var sub2 :Node2D
var start_timer:=false
var but_was_pressed:=false
var score:int=0

func _ready()->void:
	b.connect("pressed", self,"_on_Button_pressed")
	randomize()

func _process(delta: float) -> void:
	if but_was_pressed:
		start_timer=sub2.flag
		if start_timer:
			$Timer.start()
			but_was_pressed=false
	
	if sub2!=null and sub1.pep.size()==len(input_ARN.text):
		$Timer_score.stop()
		flabel.text="Your Time Is "+$Score.text
		yield(get_tree().create_timer(0.5),"timeout")
		game_over.show()
	
	

func update_score(sc:int)->void:
	$Score.text=str(sc)

func _on_Timer_timeout() -> void:
	var spawn_loc = $Path2D/SpawnPath
	spawn_loc.unit_offset=randi()
	var aac=aac_scene.instance()
	add_child(aac)
	aac.aac_color_id()
	aac.position= spawn_loc.position
	var direction= rand_range(-PI,PI)
	var velocity = Vector2(300,0)
	aac.linear_velocity=velocity.rotated(direction)



func _on_Button_pressed()->void:
	var mj_scene := preload("Mensajero.tscn")
	var mj=mj_scene.instance()
	mj.transcript=input_ARN.text
	add_child(mj)
	
	var ribo_scene := preload("Ribo.tscn")
	var ribo=ribo_scene.instance()
	sub2=ribo.get_children()[1]
	sub1=ribo.get_children()[0]
	sub2.ls_m=mj.ls_nuc
	add_child(ribo)
	
	$RNAInput.hide()
	$Timer_score.start()
	but_was_pressed=true


func _on_Timer_score_timeout() -> void:
	score+=1
	update_score(score)
	
