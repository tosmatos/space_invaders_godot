# script: spawner_enemy

extends Node

const enemy_kamikaze = preload("res://scenes/enemy_kamikaze.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn()
	pass # Replace with function body.

func spawn():
	while true:
		randomize()
		
		var enemy = enemy_kamikaze.instance()
		var pos = Vector2()
		pos.x = rand_range(0+16, get_viewport().get_visible_rect().size.x-16)
		pos.y = 0-16
		enemy.set_position(pos)
		get_node("container").add_child(enemy)
		yield(get_tree().create_timer(rand_range(1.25, 2)), "timeout")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
