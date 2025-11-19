	if face == RIGHTRUN {face = RIGHT}
	if face == LEFTRUN {face = LEFT}
	if face == UPRUN {face = UP}
	if face == DOWNRUN {face = DOWN}

// Evento End Step

// Redondear las coordenadas x e y a su entero más cercano
// Esto asegura que el personaje se detenga en una posición de píxel perfecta.
x = round(x);
y = round(y);