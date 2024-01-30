extends Node


var _score: int = 0
var _high_score: int = 0


func get_score() -> int:
	return _score
	
	
func set_score(val: int) -> void:
	_score = val
	if _score > _high_score:
		_high_score = _score
		
		
func increment_score() -> void:
	set_score(_score + 1)
	
	
func get_highh_score() -> int:
	return _high_score
