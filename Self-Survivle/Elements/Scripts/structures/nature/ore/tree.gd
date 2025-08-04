extends StaticBody2D

var random = RandomNumberGenerator.new()
var health = 10
var immortal = false
var kick

#func _ready():
	#position.x = random.randi_range(-2000,2000)
	#position.y = random.randi_range(-2000,2000)

func _process(_delta):
	if kick:
		if not immortal:
			immortal = true
			$FramesOfImmortality.start()
			GlobalInfo.inv_woodcounter += 1
			health -= 1

func _on_pick_up_tree_area_entered(area: Area2D):
	if area.name == "HandZone":
		kick = true

func _on_pick_up_tree_area_exited(area: Area2D):
	if area.name == "HandZone":
		kick = false

func _on_frames_of_immortality_timeout():
	immortal = false
