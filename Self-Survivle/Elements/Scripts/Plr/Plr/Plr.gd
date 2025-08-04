extends CharacterBody2D


var max_speed = 5
var speed = max_speed


func _physics_process(_delta):
	$Base.look_at(get_global_mouse_position())
	
	if GlobalInfo.inv_open:
		speed = 0
	else:
		speed = max_speed
	
	#УПРАВЛЕНИЕ
	
	if Input.is_action_pressed("KeyInpUP"):
		position.y -= speed
	
	if Input.is_action_pressed("KeyInpDOWN"):
		position.y += speed
	
	if Input.is_action_pressed("KeyInpLEFT"):
		position.x -= speed
	
	if Input.is_action_pressed("KeyInpRIGHT"):
		position.x += speed
	
	if Input.get_action_strength("MouseInpLB"):
		$Base/Hands/HandZone/HandZoneArea.disabled = false
		$Base/Hands/HandAnim.play("Kick")
	else:
		$Base/Hands/HandAnim.stop()
		$Base/Hands/HandZone/HandZoneArea.disabled = true
	
	$Base/Hands/Handitemsprite.texture = load(GlobalInfo.HandItem["Sprite"])
