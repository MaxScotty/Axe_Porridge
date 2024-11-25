function cutscene_end_action(){
	scene++
	
	if(scene > array_length(scene_info) - 1)
	{
		instance_destroy();
	}
}

function cutscene_wait(_seconds)
{
	timer++;
	
	if(timer >= _seconds * room_speed)
	{
		timer = 0;
		cutscene_end_action();
	}
}

function create_box_at_mouse()
{
	if(mouse_check_button_released(mb_left))
	{
		instance_create_layer(763, 95, "Instances", oItemTestCut);
		
		
		//sprite_index = sItemTestCut;
			
		if(image_index >= (image_number -1))
		{
		    image_speed = 0;
		}
	
		cutscene_end_action();
	}
}