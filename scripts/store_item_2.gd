extends PanelContainer

@onready var main = get_node("../Button")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_button_pressed() -> void:
	if main.click_count >= 30:
		main.times += 1
		main._update_label3()
		main.click_count -= 30
		main._update_label()
