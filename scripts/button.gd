extends Button

var click_count = 0
@onready var count_label = $"Panel/Label"
@onready var chance_label = $"Panel/Label2"
@onready var times_label = $"Panel/Label3"
var rng = RandomNumberGenerator.new()
var chance = 1
var countTen = 0
var times = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	_update_label2() 
	_update_label()
	_update_label3()

func _update_label():
	count_label.text = "Clicks: " + str(click_count) + "\n"

func _update_label2():
	chance_label.text = "Chance: " + str(chance * 10) + "%"
	
func _update_label3():
	times_label.text = "Times/Click: " + str(times)
	
func _on_pressed() -> void:
	for a in range(times):
		var random_num = rng.randi_range(0, 9)
		if (random_num < chance):
			click_count += 1
			countTen += 1
			_update_label()
			while (countTen >= 10):
				if (chance < 10):
					chance += 1
				countTen -= 10
			_update_label2()
			
			if (click_count == 3000):
				get_node("../Panel").visible = true
