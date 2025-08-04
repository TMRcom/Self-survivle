extends Node

var inv_open

var inv_woodcounter = 0

var InvItemScale = 3
var InvItems = [Items["Empty"],Items["WoodenPick"],Items["Empty"],Items["Empty"],Items["Empty"],Items["Empty"],Items["Empty"],]

var KickVar = false

const Items = {
	"Empty" : {
		"Name" : "Пусто",
		"Sprite" : "",
		"Icon" : "res://Elements/Texture Assets/Interface/EmptySlot.svg",
		"Type" : "System",
		"Damage" : 2
	},
	"WoodenPick" : {
		"Name" : "Деревянная кирка",
		"Sprite" : "res://Elements/Texture Assets/Plr/Items/Picks/WoodenPick.svg",
		"Icon" : "res://Elements/Texture Assets/Interface/inventory/craft/WoodenPickCraft.svg",
		"Type" : "Pick",
		"Damage" : 5
	}
}

var Slot = 1
var MaxSlot = 3

var HandItem = Items["Empty"]

func AddItem(Item):
	for i in range(GlobalInfo.InvItemScale):
		if GlobalInfo.InvItems[i] == Items["Empty"]:
			GlobalInfo.InvItems[i] = Items[Item]
			break
		elif i == 7:
			pass
