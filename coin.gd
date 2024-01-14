extends Area2D

var screensize = Vector2.ZERO

func _ready():
	$ShiningDelay.start(randf_range(1, 3))

func pickup():
	$CollisionShape2D.set_deferred("disabled", true)
	var tw = create_tween().set_parallel().set_trans(Tween.TRANS_QUAD)
	tw.tween_property(self, "scale", scale * 3, 0.3)
	tw.tween_property(self, "modulate:a", 0.0, 0.3)
	await tw.finished
	queue_free()


func _on_shining_delay_timeout():
	$AnimatedSprite2D.frame = 0
	$AnimatedSprite2D.play()
