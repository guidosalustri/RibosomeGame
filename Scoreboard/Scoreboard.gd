extends PanelContainer

onready var score_column = $MarginContainer/VBoxContainer/Scorecolumn
var player_scores={"Scrooge McDuck": 99999,
	"Madoka Magika": 700,
	"guts":200,
	"Casca":1
	
	
}

func _ready() -> void:
	for name in player_scores:
		add_row(name,str(player_scores[name]))
	
#	add_row("Portos")
#	add_row("Athos")
#	add_row("Aramis")

func add_row(player_name:String, player_points:String)->void:
	var row:= preload("ScoreLine.tscn").instance()
	score_column.add_child(row)
	row.set_player_name(player_name)
	row.set_player_points(player_points)
	player_scores[player_name]= player_points
#	var row=Label.new()
#	row.text=player_name
#	score_column.add_child(row)


func _on_HideButton_pressed() -> void:
	hide()
