extends Node2D

const background_1 = preload("res://scenes/backgrounds/level_1.tscn")
const background_2 = preload("res://scenes/backgrounds/level_2.tscn")

# Sub array layout
# 0 -> key
# 1 -> end message
# 2 -> level index
# 3 -> morse code
var level_data = [
	["Bubble Wrap SOS"
		,"Bubble wrap SOS! We require immediate popping assistance. Your mission is loud and clear."
		,1,"-... ..- -... -... .-.. . / .-- .-. .- .--. / ... --- ..."],
	["More Cats Please"
		,"Greetings, Earthling. Your planet hums with wonder. Especially the part about cats. More, please."
		,1,"-- --- .-. . / -.-. .- - ... / .--. .-.. . .- ... ."],
	["Pizza Protocol"
		,"Password for intergalactic pizza delivery: 'Pineapple DOES belong on pizza.' (Don't tell anyone!)"
		,1,".--. .. --.. --.. .- / .--. .-. --- - --- -.-. --- .-.."],
	["Emoji Language"
		,"Languages are only spoken with thoughts and words, emojis may be more efficient!"
		,2,". -- --- .--- .. / .-.. .- -. --. ..- .- --. ."],
	["Tech Support"
		,"We received your message loud and clear! Please wait a few centuries for the probe to be received!"
		,2,"- . -.-. .... / ... ..- .--. .--. --- .-. -"],
	["Moon and Mice"
		,"Your moon is the only cheese satellite in the cosmos. Luckily no mice are able to get to it!"
		,2,"-- --- --- -. / .- -. -.. / -- .. -.-. ."],
	["Vibrant Pictures"
		,"Your drawings were analyzed. Our scientists are baffled. Please continue. You may be the key."
		,3,"...- .. -... .-. .- -. - / .--. .. -.-. - ..- .-. . ..."],
	["Sleepy Night"
		,"Your bedtime is a conspiracy. Truth sleeps in shadows. Stay curious, stay up."
		,3,"... .-.. . . .--. -.-- / -. .. --. .... -"],
	["Browser History"
		,"Your browser history raised eyebrows. And questions. Mostly awe. Keep digging—you’re onto something."
		,3,"-... .-. --- .-- ... . .-. / .... .. ... - --- .-. -.--"],
	["Void Exploration"
		,"The starts are now being filled with your communications. We can hear you, and so can the void."
		,4,"...- --- .. -.. / . -..- .--. .-.. --- .-. .- - .. --- -."],
	["Bridge Building"
		,"We intercepted your imagination. Chaotic. Brilliant. Unfiltered. Don’t stop, you’re building a bridge."
		,4,"-... .-. .. -.. --. . / -... ..- .. .-.. -.. .. -. --."],
	["Unfiltered Sound"
		,"You cracked the silence with a spark. We’re listening. And you’re closer than you think."
		,4,"..- -. ..-. .. .-.. - . .-. . -.. / ... --- ..- -. -.."],
	["Questions and Voices"
		,"You are the conversation. You are the question and the key. We hear you. And now… you hear us too."
		,5,"--.- ..- . ... - .. --- -. ... / .- -. -.. / ...- --- .. -.-. . ..."],
	["A Missing Voice"
		,"You were never alone. You just forgot how to listen. The universe missed your voice."
		,5,".- / -- .. ... ... .. -. --. / ...- --- .. -.-. ."],
	["Distance Memories"
		,"You are not lost. You are unfolding. The cosmos leans closer when you begin to remember."
		,5,"-.. .. ... - .- -. -.-. . / -- . -- --- .-. .. . ..."]
]
var current_level_data: Array

# TODO: clamp level_index
var level_index: int = 1
var max_level: int = 5

func _ready() -> void:
	self.level_data.shuffle();
	update_current_level_data()

func update_current_level_data() -> void:
	self.current_level_data = level_data[level_data.find_custom(_is_current_level.bind())]

func _is_current_level(data: Array) -> bool:
	if (data[2] == State.level_index):
		return true;
	return false;
