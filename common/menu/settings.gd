extends Panel
@onready var volume: HSlider = $Panel/Volume
@onready var music_2: HSlider = $Panel/Music2
@onready var sfx_2: HSlider = $Panel/Sfx2
@onready var full_screen: CheckBox = $Panel/FullScreen
@onready var quit: Button = $"../Menu/VBoxContainer/Quit"
@onready var credits: Panel = $"../Credits"
@onready var settings: Panel = $"."


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#volume
	
	var sfx = AudioServer.get_bus_index("SFX")
	var music = AudioServer.get_bus_index("Music")
	var master = AudioServer.get_bus_index("Master")
	
	AudioServer.set_bus_volume_db(master, volume.value)
	AudioServer.set_bus_volume_db(music, music_2.value)
	AudioServer.set_bus_volume_db(sfx, sfx_2.value)
	


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_settings_pressed() -> void:
	credits.visible = false
	settings.visible = true


func _on_credits_pressed() -> void:
	credits.visible = true
	settings.visible = false


func _on_full_screen_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
