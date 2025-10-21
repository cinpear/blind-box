extends PanelContainer
var cost = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"HBoxContainer/Label2".text = "Cost: " + str(cost)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if Global.click_count >= cost && Global.moveable == true:
		Global.click_count -= cost
		Global.moveable = false
