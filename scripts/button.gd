extends Button

@onready var count_label = $"Panel/Label"
@onready var chance_label = $"Panel/Label2"
@onready var times_label = $"Panel/Label3"

var rng = RandomNumberGenerator.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	_update_label2() 
	_update_label()
	_update_label3()

func _update_label():
	count_label.text = "Clicks: " + str(Global.click_count) + "\n"

func _update_label2():
	chance_label.text = "Chance: " + str(Global.chance * 10) + "%"
	
func _update_label3():
	times_label.text = "Times/Click: " + str(Global.times)
	
func _on_pressed() -> void:
	for a in range(Global.times):
		var random_num = rng.randi_range(0, 9)
		if (random_num < Global.chance):
			Global.click_count += 1
			Global.countTen += 1
			_update_label()
			while (Global.countTen >= 10):
				if (Global.chance < 10):
					Global.chance += 1
				Global.countTen -= 10
			_update_label2()
			
			if (Global.click_count == 3000):
				get_node("../Panel").visible = true
