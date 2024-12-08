function TextScript(_text, _portrait, _side)
{
	SetDefaultsForText();
	
	text[page_number] = _text;
	
	if argument_count > 1
	{
		switch(argument[1])
		{
			case "Officer":
				speaker_sprite[page_number] = sFaceTest1;
				speaker_side[page_number] = 1;
				txtb_spr[page_number] = sTextbox;
				break;
				
			case "Granny":
				speaker_sprite[page_number] = sFaceTest2;
				speaker_side[page_number] = -1;
				txtb_spr[page_number] = sTextbox;
				break;
		}
	}
	
	if argument_count > 2
	{
		speaker_side[page_number] = argument[2];
	}
	
	page_number++;
}

function create_textbox(_text_id)
{
	with(instance_create_depth(0, 0, -9999, oTextBox))
	{
		GameText(_text_id);
	}
}

function SetDefaultsForText()
{
	line_break_pos[0, page_number] = 999;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	txtb_spr[page_number] = sTextbox;
	speaker_sprite[page_number] = noone;
	speaker_side[page_number] = 1;
}