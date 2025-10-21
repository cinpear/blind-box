extends PanelContainer

@onready var cost_label = $"HBoxContainer/Label2"
@onready var win_label = $"HBoxContainer/Label3"
var rng = RandomNumberGenerator.new()

func _ready() -> void:
	_update_cost_label()

func _update_cost_label():
	cost_label.text = "Cost: " + str(Global.gachacost)

func _on_button_pressed() -> void:
	if Global.click_count >= Global.gachacost:
		Global.click_count -= Global.gachacost
		Global.gachacost += 1
		_update_cost_label()
		var randomNum = rng.randi_range(0, 2)
		if (randomNum == 0):
			Global.chance += 7
			win_label.text = "Congrats! Chance +7%"
		elif (randomNum == 1):
			Global.times += 3
			win_label.text = "Congrats! Click time +3"
		else:
			win_label.text = "Oof you unlucky"
