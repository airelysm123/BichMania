extends Area2D

var Velocidad = 400
var Movimiento = Vector2()
var Limite
signal golpe

func _ready():
	hide()
	Limite = get_viewport_rect().size


func _process(delta):
	Movimiento = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		Movimiento.x += 1
	if Input.is_action_pressed("ui_left"):
		Movimiento.x -= 1
	if Input.is_action_pressed("ui_down"):
		Movimiento.y += 1
	if Input.is_action_pressed("ui_up"):
		Movimiento.y -= 1
	if Movimiento.length() > 0:
		Movimiento = Movimiento.normalized() * Velocidad
	
	position += Movimiento * delta
	position.x = clamp(position.x, 0, Limite.x)
	position.y = clamp(position.y, 0, Limite.y)
	
	if Movimiento.x != 0:
		$AnimatedSprite2D.animation = "ladoI"
		$AnimatedSprite2D.flip_h = Movimiento.x > 0


func _on_body_entered(body):
	hide()
	emit_signal("golpe")
	$CollisionShape2D.disabled = true
	
func inicio(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	
	
	
	
	
	
	
