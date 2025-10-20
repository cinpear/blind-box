extends PanelContainer

@onready var main = get_node("../Button")
@onready var cost_label = $"HBoxContainer/Label2"
var cost = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_update_cost_label()
	pass # Replace with function body.

func _update_cost_label():
	cost_label.text = "Cost: " + str(cost)

func _on_button_pressed() -> void:
	if main.click_count >= cost && main.chance < 10:
		main.click_count -= cost
		cost += 1
		_update_cost_label()
		main.chance += 1
		main._update_label()
		main._update_label2()
		
