extends Control

const MAIN = preload("res://scenes/main/main.tscn")

@onready var level_label = $MC/VB/LevelLabel
@onready var attempts_label = $MC/VB/AttemptsLabel
@onready var game_over_sound = $GameOverSound
@onready var vb_2 = $MC/VB2


# Called when the node enters the scene tree for the first time.
func _ready():
	level_label.text = "LEVEL %s" % ScoreManager.get_level_selected()
	update_attempts(0)
	SignalManager.on_score_updated.connect(update_attempts)
	SignalManager.on_level_complete.connect(on_level_complete)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("menu"):
		get_tree().change_scene_to_packed(MAIN)


func update_attempts(attempts: int) -> void:
	attempts_label.text = "ATTEMPTS %s" % attempts


func on_level_complete() -> void:
	vb_2.show()
	game_over_sound.play()
