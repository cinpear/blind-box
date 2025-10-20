extends Button

var click_count = 0
@onready var count_label = $"Label"
var rng = RandomNumberGenerator.new()
var chance = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	_update_label()

func _update_label():
	count_label.text = "Clicks: " + str(click_count) + "\n"

func _on_pressed() -> void:
	var random_num = rng.randi_range(0, 9)
	if (random_num < chance):
		click_count += 1
		_update_label()
		chance = click_count / 10 + 1
		print(chance)
