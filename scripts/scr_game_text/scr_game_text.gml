// parametro _text_id
function scr_game_text(_text_id){
switch(_text_id) {
	
	case "escalera":
		scr_text("es una escalera de cuerda       ...", "yesica")
		scr_text("ha tenido dias mejores", "yesica")
	break;
	
	case "tronco":
		scr_text("este tronco esta convenientemente caido", "yesica exceptic")
		scr_text("bajar por el?")
		scr_text("")
			scr_option("   Si", "tronco 1-1")
			scr_option("   No", "tronco 1-2")
	break;
	
	case "tronco 1-1":
		scr_roomtp(310, 230, rm_room3, DOWN)
	break;
		case "tronco 1-2":
		scr_text("Bueno, sera despues", "yesica confused")
	break;
	
	case "tilina 1":
		scr_text("Holaaa, no se porque cierta gente cree que me veo bien")
		scr_text("tu que opinas de esas cosas")
		scr_text("tranquila yo te adorare por ellos", "yesica asertive")
	break;
	case "fuego 1":
		scr_text("Hola")
		scr_text("Ola", "yesica")
		scr_text("Sabes quienes son el empaty team? :D")
		scr_text("Oooooookey? quienes son esos?", "yesica exceptic")
		scr_text("nose, supuse que tu lo sabrias")
		scr_text("supongo que esta es una menera de perder el tiempo aqui", "yesica confused")
	break;

	
	case "npc 1":
		scr_text("Esto es una prueba de como se verian 2 opciones", "yesica")
		scr_text(" ")
			scr_option("Opcion A, Kris muere", "npc 1 - 1")
			scr_option("Opcion B, Cristo Muere", "npc 1 - 2")
	break;
	
	case "npc 1 - 1":
		scr_text("jaja, que esperabas, solo murio y ya d:")
	break;
	
	case "npc 1 - 2":
		scr_text("Si, ahora Cristo murio, eres muyyyy, creativo");
	break;
	
	
	case "npc 2":
		scr_text("Esto es una prueba de como se verian 3 opciones", "yesica")
		scr_text(" ")
			scr_option("Borrar la cuenta", "npc 2 - 1")
			scr_option("Activar cam", "npc 2 - 2")
			scr_option("No hacer nada", "npc 2 - 3")
	break;

	case "npc 2 - 1":
		scr_text("Borras la cuenta, lo cual resulta ser la mejor desicion de tu vida :D");
	break;
	
	case "npc 2 - 2":
		scr_text("Espera, esta opcion no se supone que deberia estar aqui, que raro");
		scr_text("Que es geometry dash?");
	break;
	
	case "npc 2 - 3":
		scr_text("No haces nada y aun asi Cristo muere de regreso");
	break;
	
	case "npc 3":
		scr_text("Esto es una prueba de como se verian 4 opciones", "yesica")
		scr_text(" ")
			scr_option("Cristo saca una escopeta", "npc 3 - 1")
			scr_option("Pixeb saca empaty", "npc 3 - 2")
			scr_option("Zeito abraza a todos", "npc 3 - 3")
			scr_option("Vemy dibuja a todos", "npc 3 - 4")
	break;
	
	case "npc 3 - 1":
		scr_text("Oohh noooo D:, nos va a papiar")
		scr_text("*lo que no sabe Cristo es que yo tengo otra escopeta*")
	break;
	
	case "npc 3 - 2":
		scr_text("Wooooow, quien lo diria, por fin el juego salio y se volvio exitoso :D");
		scr_text("Lo unico malo es que esto solo sea una opcion de texto :(");
		scr_text("POR AHORA!!!");
	break;

	case "npc 3 - 3":
		scr_text("Todo el equipo de empaty murio de felicidad :3")
		scr_text("y por eso no salio el juego D:")
	break;
	
	case "npc 3 - 4":
		scr_text("Vemy se ocupo tanto dibujando que no pudo seguir con empati")
		scr_text("por como un mes xd")
	break;
	
	case "piedra":
		scr_text("Yo solo soy una piedra")
		scr_text("Jeje")
		scr_text("Bueno, eso fue raro", "yesica")
	break;

	
	
	}
}