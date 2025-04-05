extends Control

@export var cypher_text_button: Button;
@export var answer_panel: Panel;

func _process(delta: float) -> void:
	if (answer_panel.visible):
		if (Input.is_action_just_pressed("ui_cancel")):
			cypher_text_button.visible = true;
			answer_panel.visible = false;


func _on_button_button_down() -> void:
	cypher_text_button.visible = false;
	answer_panel.visible = true;
	answer_panel.get_node("AnswerInput").grab_focus();
