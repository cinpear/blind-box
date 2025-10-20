extends Button

var click_count = 0
@onready var count_label = $"Label"
@onready var chance_label = $"Panel/Label2"
var rng = RandomNumberGenerator.new()
var chance = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	_update_label2() 
	_update_label()

func _update_label():
	count_label.text = "Clicks: " + str(click_count) + "\n"

func _update_label2():
	chance_label.text = "Chance: " + str(chance * 10) + "%"
	
func _on_pressed() -> void:
	var random_num = rng.randi_range(0, 9)
	if (random_num < chance):
		click_count += 1
		_update_label()
		chance = click_count / 10 + 1
		_update_label2()
		
		if (click_count == 150):
			print("you win")
