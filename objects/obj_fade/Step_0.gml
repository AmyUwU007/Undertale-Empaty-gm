// 1. Control del Timer basado en el Estado
// El Fade In (Oscurecimiento) y Fade Out (Aclaramiento) son independientes.

if state == 0 { // Estado 0: Fade In (Incrementa timer de 0 a duration)
    timer++;
}

if state == 1 { // Estado 1: Fade Out (Decrementa timer de duration a 0)
    timer--;

    if timer <= 0 {
        // La transición ha terminado, destruimos la instancia
        instance_destroy();
    }
}


// 2. Lógica de Transición de Habitación y Cambio de Estado

// Esta acción SÓLO debe ocurrir una vez cuando el Fade In termina (timer == duration)
// y estamos en el estado de oscurecimiento (state == 0).
if timer >= duration && state == 0 {
    
    // A. Cambiar de habitación y mover al jugador
    room_goto(target_rm);
    
    // B. Mover al jugador a la posición de destino
    // Es crucial hacer esto DESPUÉS del room_goto
    obj_player.x = target_x;
    obj_player.y = target_y;
	obj_player.face = target_face;
    
    // C. Cambiar al estado 1 para iniciar el Fade Out (Aclaramiento)
    state = 1; 
}


// 3. Valor de Transparencia (Alpha)

// La división siempre debe calcular la proporción de 0 a 1 (0% a 100% de transparencia)
alpha = timer / duration;