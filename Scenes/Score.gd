extends ParallaxBackground

@onready var score_detect_l = $ScoreDetectL
@onready var score_num = $"../ScoreLabel/ScoreNum"
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	score_detect_l.motion_offset.x -= 200 *delta


func _on_score_detect_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	score +=1
	score_num.text = str(score)
