extends KinematicBody2D

export(String) var type = "INIMIGO"
var movedir = dir.center
var knockdir = dir.center
var spritedir = "baixo"

var hitstun = 0
var health = 1

export(int) var velocidade = 0

"""func movement_loop():
	var motion
	if hitstun == 0:
		motion = knockdir * velocidade * 2
	#else: 
	motion = movedir * velocidade
	move_and_slide(motion,Vector2(0,0))
	
"""
func movement_loop():
	var motion
	if hitstun > 0:
		motion = knockdir.normalized() * velocidade * 1.5
	else:
		motion = movedir.normalized() * velocidade
	move_and_slide(motion, Vector2.ZERO)

func loop_spritedir():
	match movedir:
		dir.left:
			spritedir = "esquerda" 
		dir.right:
			spritedir = "direita" 
		dir.up:
			spritedir = "cima" 
		dir.down:
			spritedir = "baixo" 
			
func mudar_anim(animation):
	var nova_anim = str(animation,spritedir)
	if $anim.current_animation != nova_anim:
		$anim.play(nova_anim) 

func loop_dano():
	if hitstun > 0:
		hitstun -= 1
	for body in $hitbox.get_overlapping_bodies():
		if hitstun == 0 and body.get("DANO") != null and body.get("type") != type:
			health -= body.get("DANO")
			hitstun = 10
			knockdir = transform.origin - body.transform.origin
