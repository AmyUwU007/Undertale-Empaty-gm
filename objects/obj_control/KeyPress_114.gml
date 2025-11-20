windowX = window_get_width()
windowY = window_get_height()

if windowX + 320 <= screenX && windowY + 240 <= screenY
			{
				window_set_size(windowX+320, windowY+240); alarm[0] = 1;
			}else {window_set_size(320, 240); alarm[0] = 1;}