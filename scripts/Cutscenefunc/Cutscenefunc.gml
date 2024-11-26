function cutscene_end_action(){
	scene++
	
	if(scene > array_length(scene_info) - 1)
	{
		instance_destroy();
		exit;
	}
	
	event_perform(ev_other, ev_user0);
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
		cutscene_end_action();
	}
}

function cutscene_instance_create(_x, _y, layer_id, obj)
{
	var instLay = instance_create_layer(_x, _y, layer_id, obj);
	cutscene_end_action();
	
	return 0;
}

function create_cutscene(_scene)
{
	var inst = instance_create_layer(0,0, "Instances", oCutscene)
	
	with(inst)
	{
		scene_info[scene] = _scene;
		event_perform(ev_other, ev_user0);
	}
}