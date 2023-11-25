extends ParallaxBackground

# Onready Files
@onready var score_detect_l = $ScoreDetectL
@onready var score_num = $"../ScoreLabel/ScoreNum"

#Variables
var score = 0


func _ready():
	pass

func _process(delta):
	
	# Moves score bar (violet colored Area2D)
	score_detect_l.motion_offset.x -= 400 *delta

#Adds and Updates score to label text
func _on_score_detect_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	score +=1
	score_num.text = str(score)
