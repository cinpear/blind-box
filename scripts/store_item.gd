extends PanelContainer

@onready var cost_label = $"HBoxContainer/Label2" 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_update_cost_label()
	pass # Replace with function body.

func _update_cost_label():
	cost_label.text = "Cost: " + str(Global.cost1)
	
func _on_button_pressed() -> void:
	if Global.click_count >= Global.cost1 && Global.chance < 10:
		Global.click_count -= Global.cost1
		Global.cost1 += 1
		_update_cost_label()
		Global.chance += 1
		
