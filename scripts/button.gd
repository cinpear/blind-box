extends Button

@onready var count_label = $"Panel/Label"
@onready var chance_label = $"Panel/Label2"
@onready var times_label = $"Panel/Label3"
@onready var total_label = $"Panel/Label4"

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
	chance_label.text = "Chance: " + str(Global.chance * 10) + "%"
	
func _update_label3():
	times_label.text = "Times/Click: " + str(Global.times)
	
func _update_label4():
	total_label.text = "Lifetime Clicks: " + str(Global.total_clicks)
	
func _move_button():
	$".".x = 400
	$".".y = 500
	
func _on_pressed() -> void:
	for a in range(Global.times):
		var random_num = rng.randi_range(0, 9)
		if (random_num < Global.chance):
			Global.click_count += 1
			Global.total_clicks += 1
			Global.countTen += 1
			_update_label()
			_update_label4()
			while (Global.countTen >= 10):
				if (Global.chance < 10):
					Global.chance += 1
				Global.countTen -= 10
			_update_label2()
			
			if (Global.click_count == 3000):
				get_node("../Panel").visible = true
	_move_button()
