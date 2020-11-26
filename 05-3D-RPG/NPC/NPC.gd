extends KinematicBody

onready var Dialogue = get_node("/root/Game/UI/Dialogue")
export var dio_used = 0

var dialogue = [
	"Welcome! (Press E to continue)"
	,"That's a neat lightsaber you have there!"
	,"I bet you'd want to use that to break all of the targets."
	,"You might want to watch that counter in the corner."
	,"There are beings that may want to hurt you but your weapon will take care of that!"
	,"(Press E to start time)"
]

func _ready():
	$AnimationPlayer.play("Idle")
	Dialogue.connect("finished_dialogue", self, "finished")



func _on_Area_body_entered(body):
	Dialogue.start_dialogue(dialogue)
	dio_used += 1


func _on_Area_body_exited(body):
	Dialogue.hide_dialogue()

func finished():
	get_node("/root/Game/Target_container").show()
	Global.timer = 120
	Global.update_time()
	get_node("/root/Game/UI/Timer").start()
