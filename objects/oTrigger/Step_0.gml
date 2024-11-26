if(!instance_exists(oCutscene))
{
	if place_meeting(x, y, oItemTest) //and mouse_check_button_released(mb_left)
	{
		create_cutscene(t_scene_info);
		instance_destroy();
	}
}