class_name DamageNumber extends Control

@onready var label: Label = %Label

var text: String:
	set(v):
		label.text = v
	get:
		return label.text

var label_settings: LabelSettings:
	set(v):
		label.label_settings = v
	get:
		return label.label_settings
