extends RigidBody2D


func _on_RigidBody2D_body_entered(body: Node) -> void:
	if body is RigidBody2D:
		var a:=self.get_path()
		var b :=body.get_path()
		var j := PinJoint2D.new()
		j.set_node_a(a)
		j.set_node_b(b)
		print(j)
		print(j.set_node_b(b))
