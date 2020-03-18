extends "res://engine/entity.gd"

func _physics_process(_delta):
	controls_loop()
	loop_spritedir()
	loop_dano()
	movement_loop()
	
	if movedir == dir.center:
		mudar_anim("idle")
	elif is_on_wall():
		mudar_anim("push")
	else:
		mudar_anim("andar")
		
func controls_loop():
	var LEFT 	= Input.is_action_pressed("ui_left")
	var RIGHT 	= Input.is_action_pressed("ui_right")
	var UP 		= Input.is_action_pressed("ui_up")
	var DOWN 	= Input.is_action_pressed("ui_down")
	 
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)
