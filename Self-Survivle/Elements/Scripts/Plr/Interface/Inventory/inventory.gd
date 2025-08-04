extends Control



var InvOpen = false

#func _ready():
	#$Crafts/PickCraft/PickCraftButton.modulate.v = 100


func _process(_delta: float):
	GlobalInfo.inv_open = InvOpen
	if Input.is_action_just_pressed("KeyInpInventory") and not InvOpen:
		InvOpen = true
	if Input.is_action_just_pressed("KeyInpExit") and InvOpen:
		InvOpen = false
	
	if Input.is_action_just_pressed("f"):
		GlobalInfo.inv_woodcounter += 10
	
	$Resourses/Wood/Counter.text = str(GlobalInfo.inv_woodcounter)
	
	visible = InvOpen
	
	if GlobalInfo.inv_woodcounter < 10:
		var c = 0.2
		$Crafts/WoodenPickCraft/WoodenPickCraftButton.modulate = Color(c, c, c)
	else:
		var c = 1
		$Crafts/WoodenPickCraft/WoodenPickCraftButton.modulate = Color(c, c, c)
	
	var i = 0
	while i < 7:
		if i >= GlobalInfo.InvItemScale:
			$Items/ItemList.set_item_disabled(i, true)
		else :
			$Items/ItemList.set_item_disabled(i, false)
		$Items/ItemList.set_item_text(i, GlobalInfo.InvItems[i]["Name"])
		$Items/ItemList.set_item_icon(i, load(GlobalInfo.InvItems[i]["Sprite"]))
		i += 1

func _on_item_list_item_activated(index: int):
	GlobalInfo.HandItem = GlobalInfo.InvItems[index]

func _on_wooden_pick_craft_button_button_down() -> void:
	if GlobalInfo.inv_woodcounter >= 10:
		GlobalInfo.inv_woodcounter -= 10
