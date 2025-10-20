extends PanelContainer

@onready var main = get_node("../Button")
@onready var cost_label = $"HBoxContainer/Label2"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_update_cost_label()
	pass # Replace with function body.

func _update_cost_label():
	cost_label.text = "Cost: " + str(Global.cost2)

func _on_button_pressed() -> void:
	if Global.click_count >= Global.cost2:
		Global.click_count -= Global.cost2
		Global.cost2 += 2
		_update_cost_label()
		Global.times += 1
		main._update_label3()
		main._update_label()
