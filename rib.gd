extends Area2D

onready var sub_2:Node2D=get_parent().get_children()[1]
onready var timer_block :Timer= Timer.new()

var amino_acido:RigidBody2D=null
var pep:=[]
var a:Node2D=null
var flag:=false
var step_rib:=false
var rib_empty:=true

func _ready() -> void:
	randomize()
	timer_block.connect("timeout",self,"_on_Timer_timeout")
	timer_block.wait_time = 3
	timer_block.one_shot = true
	timer_block.autostart=false
	add_child(timer_block)

func _process(delta: float) -> void:

	modulate=sub_2.set_color

	if flag:
		follow(self,pep[0], delta,Vector2(0,55))
		for amino in range(pep.size()-1):
			follow(pep[amino],pep[amino+1], delta, Vector2(0,35))
	if not rib_empty:
		a.global_position=global_position


func _on_Area2D_area_entered(area: Area2D) -> void:
	var aa=area.get_parent()
	match aa.get_groups():
		["Aac"]:
			if modulate==aa.get_children()[0].modulate and rib_empty:
				amino_acido=aa
				amino_acido.collision_layer=0
				amino_acido.collision_mask=0
				flag=true
				pep.insert(0,amino_acido)
				step_rib=true
			elif rib_empty:
				a=aa
				a.get_children()[1].stop()
				timer_block.start()
				rib_empty=false

func follow(t:Node2D,b:RigidBody2D,delta:float,off_set:Vector2)->void:
	var pos:=b.global_position+off_set
	var direction := pos.direction_to(t.global_position)
	var spd:=395
	var drag_factor := 0.4
	b.get_children()[3].monitorable=false
	b.get_children()[3].monitoring=false
	# Steer to the target
	var desired_velocity := spd * direction
	var steering_vector := desired_velocity - b.linear_velocity
	b.linear_velocity += steering_vector * drag_factor
	b.position += b.linear_velocity * delta
	b.rotation = b.linear_velocity.angle()

func _on_Timer_timeout() -> void:
	rib_empty=true
	a.queue_free()
