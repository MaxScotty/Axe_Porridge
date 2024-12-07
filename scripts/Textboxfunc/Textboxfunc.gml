function TextScript(_text)
{
	SetDefaultsForText();
	
	text[page_number] = _text;
	
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
}