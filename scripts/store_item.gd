extends PanelContainer

@onready var main = get_node("../Button")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_button_pressed() -> void:
	print(main.click_count)
	if main.click_count >= 10 && main.chance < 10:
		print("bought!")
		main.click_count -= 10
		main.chance += 1
		main._update_label()
		main._update_label2()
		
