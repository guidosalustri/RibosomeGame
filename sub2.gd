extends Area2D

export var speed:=400
var flag:=false
var end_game:=false
var ls_m:=[]
var k:=0
var set_color:Color="e1ffffff"
onready var rib:Node2D=get_parent().get_children()[0]


func _process(delta: float) -> void:

	if flag:
		follow(self,ls_m[k], delta,Vector2(0,55))
		set_color=ls_m[k].modulate
		var j:=k
		while j <ls_m.size()-1:
			follow(ls_m[j],ls_m[j+1], delta,Vector2(-35,0))
			j+=1
		var f:=k
		while f>0:
			follow(ls_m[f],ls_m[f-1],delta,Vector2(35,0))
			f-=1

	if rib.step_rib and k<ls_m.size()-1:
		k+=1
		rib.step_rib=false

	if k==ls_m.size()-1:
		end_game=true


func follow(t:Node2D,b:RigidBody2D,delta:float, off_set:Vector2)->void:
	var pos:=b.global_position+off_set
	var direction := pos.direction_to(t.global_position)
	var spd:=405
	var drag_factor := 0.5
	# Steer to the target
	var desired_velocity := spd * direction
	var steering_vector := desired_velocity - b.linear_velocity
	b.linear_velocity += steering_vector * drag_factor
	b.position += b.linear_velocity * delta
	b.rotation = b.linear_velocity.angle()


func _on_sub2_area_entered(area: Area2D) -> void:
	var mensajero:=area.get_parent()
	match mensajero.get_groups():
		["Nuc"]:
			if area.get_parent()==ls_m[0]:
				flag=true
