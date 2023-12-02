extends StaticBody2D

# A door that can be opened or closed by using a lever

var is_closed : bool = true

func activate():
	if is_closed:
		self.hide()
		$CollisionShape2D.disabled=true
		is_closed=false
	else :
		self.show()
		$CollisionShape2D.disabled=false
		is_closed=true
