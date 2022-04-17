extends Node2D

var total : float = 0

func _ready() -> void:
	update_score(total)

func _process(delta: float) -> void:
	total += delta
	update_score(total)
	
func update_score(current_score: float) -> void:
	$Score.text = str(current_score)
	
	
