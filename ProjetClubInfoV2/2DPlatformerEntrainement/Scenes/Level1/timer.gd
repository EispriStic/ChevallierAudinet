extends Label

var time = 0

func _ready():
	pass


func _process(delta):
	
	time += delta
	
	var mil = fmod(time,1)*1000
	var sec = fmod(time,60)
	var minu = fmod(time,60*60) / 60
	
	var time_passed = "%02d : %02d : %03d" % [minu,sec,mil]
	
	text = time_passed
	

