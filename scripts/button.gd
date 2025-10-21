extends Button

@onready var count_label = $"../Panel2/VBoxContainer/HBoxContainer2/Label"
@onready var chance_label = $"../Panel2/VBoxContainer/HBoxContainer2/Label2"
@onready var times_label = $"../Panel2/VBoxContainer/HBoxContainer/Label3"
@onready var total_label = $"../Panel2/VBoxContainer/HBoxContainer/Label4"

var rng = RandomNumberGenerator.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	_update_label()
	_update_label2() 
	_update_label3()
	_update_label4()

func _update_label():
	count_label.text = "Clicks: " + str(Global.click_count) + "\n"

func _update_label2():
	chance_label.text = "Chance: " + str(Global.chance) + "%"
	
func _update_label3():
	times_label.text = "Times/Click: " + str(Global.times)
	
func _update_label4():
	total_label.text = "Lifetime Clicks: " + str(Global.total_clicks)
	
func _move_button():
	var x = rng.randi_range(100, 1000)
	var y = rng.randi_range(100, 700)
	self.position = Vector2(x, y)
	
func _on_pressed() -> void:
	for a in range(Global.times):
		var random_num = rng.randi_range(1, 100)
		if (random_num < Global.chance):
			Global.click_count += 1
			Global.total_clicks += 1
			Global.countTen += 1
			_update_label()
			_update_label4()
			while (Global.countTen >= 10):
				if (Global.chance <= 100):
					Global.chance += 1
				Global.countTen -= 10
			_update_label2()
			
			if (Global.click_count == 5000):
				get_node("../Panel").visible = true
	if (Global.moveable):
		_move_button()
