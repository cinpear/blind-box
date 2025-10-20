extends PanelContainer

@onready var main = get_node("../Button")
@onready var cost_label = $"HBoxContainer/Label2"
var cost = 30

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_update_cost_label()
	pass # Replace with function body.

func _update_cost_label():
	cost_label.text = "Cost: " + str(cost)

func _on_button_pressed() -> void:
	if main.click_count >= cost:
		main.click_count -= cost
		cost += 2
		_update_cost_label()
		main.times += 1
		main._update_label3()
		main._update_label()
