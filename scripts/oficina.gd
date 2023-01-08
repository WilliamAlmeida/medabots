extends Node2D


func _ready() -> void:
	var buttons : Array
	for button in $ui_oficina/control.get_children():
		buttons.append(button)

	for i in buttons.size():
		buttons[i].connect("pressed", self, "_on_change_piece", [buttons[i]])
		


func _on_change_piece(button) -> void:
	for piece in $tinpet.get_children():
		if button.piece_name.match(piece.name):
			if piece.get_child_count() > 0:
				piece.get_child(0).queue_free()
				
			var new_piece = button.piece_instance.instance()
			piece.add_child(new_piece)
