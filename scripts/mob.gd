extends PathFollow2D
class_name Mob

@export var speed: int = 100
@onready var anim_sprite: AnimatedSprite2D = %AnimatedSprite2D

var is_selected: bool = false

func _process(dt: float) -> void:
	progress += speed * dt
	if progress_ratio >= 1.0:
		queue_free()

func _on_input_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				clicked()

func clicked() -> void:
	print("%s clicked" % name)
	get_viewport().set_input_as_handled()
	if is_selected:
		deselect()
	else:
		select()

func select() -> void:
		anim_sprite.use_parent_material = false
		is_selected = true

func deselect() -> void:
		anim_sprite.use_parent_material = true
		is_selected = false


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area is HurtBox:
		queue_free()
