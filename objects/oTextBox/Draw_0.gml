accept_key = keyboard_check_pressed(vk_space);
textbox_x = camera_get_view_x(view_camera[0]) + 500
textbox_y = camera_get_view_y(view_camera[0]) + 44;

//setup
if setup == false
{
	setup = true;
	//draw_set_font(FONT)
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//loop through the pages
	//page_number = array_length(text);
for(var p = 0; p < page_number; p++)
		{
			
		text_length[p] = string_length(text[p]);
			
			text_x_offset[p] = 228; //big textbox's distance to left
			portrait_x_offset[p] = 124 ; //small textbox's distance to left
			//character on right
			if speaker_side[p] == -1{ //-1 means if other people is talking its emotion box
				text_x_offset[p] = 124; // other people's big textbox's distance to left
				portrait_x_offset[p] = 438 // other people's small textbox's distance to left
 				}
			
			//no character (center the textbox)
			if speaker_sprite[p] == noone {
				text_x_offset[p] = 160; //center the textbox's distance to left
				}
			
		
		
		//setting individual characters and finding where the lines of text should break
		for (var c = 0; c < text_length[p]; c++)
			{
			
			var _char_pos = c+1;
			
			//store individual characters in the "char" array
			char[c, p] = string_char_at(text[p], _char_pos);
			
			//get current width of the line
			var _txt_up_to_char = string_copy (text[p], 1, _char_pos)
			var _current_txt_w = string_width( _txt_up_to_char ) - string_width(char[c, p] );
			
			//get the last free space
			if char[c, p] == " " { last_free_space = _char_pos+1 };
			
			//get the line breaks
			if _current_txt_w - line_break_offset[p] > line_width
				{
				line_break_pos[ line_break_num[p] , p ] = last_free_space;
				line_break_num[p]++;
				var _txt_up_to_last_space = string_copy( text[p], 1, last_free_space );
				var _last_free_space_string = string_char_at( text[p], last_free_space );
				line_break_offset[p] = string_width( _txt_up_to_last_space ) - string_width( _last_free_space_string );
				
				}
			}
			
			
		//getting each characters coordinates	
		for (var c = 0; c < text_length[p]; c++)
			{
			
			var _char_pos = c+1;
			var _txt_x = textbox_x + text_x_offset[p] + border;
			var _txt_y = textbox_y;
			//get current width of the line
			var _txt_up_to_char = string_copy (text[p], 1, _char_pos)
			var _current_txt_w = string_width( _txt_up_to_char ) - string_width(char[c, p] );
			var _txt_line = 0;
			
			//compensate for string breaks
			for (var lb = 0; lb < line_break_num[p]; lb++)
				{
				//if the current looping character is after a line break
				if _char_pos >= line_break_pos[lb, p]
					{
					var _str_copy = string_copy( text[p], line_break_pos[lb,p], _char_pos-line_break_pos[lb, p] );
					_current_txt_w = string_width( _str_copy );
					
					//record the "line" this character should be on
					_txt_line = lb+1; //+1 since lb starts at 0
					}
				
				
				}
				
			//add to the x and y coordinates base on the new info
			char_x[c, p] = _txt_x + _current_txt_w;
			char_y[c, p] = _txt_y + _txt_line*line_sep;
			
			}
		
		
		}
	
	}





//------------typing the text--------------//
if text_pause_timer <= 0
	{
		
		
		
	if draw_char < text_length[page]
		{
		draw_char += text_spd;
		draw_char = clamp(draw_char, 0, text_length[page]);
		var _check_char = string_char_at ( text[page], draw_char );
		if _check_char == "." || _check_char == "?" || _check_char == "!" || _check_char == ","
			{
			text_pause_timer = text_pause_time;	
			/*if !audio_is_playing(snd[page]) {
				audio_play_sound(snd[page], 8, false);
				}
			} 
			
			else
			{
			//typing sound
			if snd_count < snd_delay {
				
				snd_count++;
			} else {
				snd_count = 0;
				audio_play_sound(snd[page], 8, false);
				
				
			}*/
		}
				
				
	
		}
	} else {

	text_pause_timer--;
	
	
}
	
	
	
//--------------flip through pages-------------//
if accept_key
	{
	
	//if the typing is done
	if draw_char == text_length[page]
		{
		//next page	
		if page < page_number-1	
			{
			page++;
			draw_char = 0;
			}
		//destroy textbox	
		else
			{
			instance_destroy();
			}
			
		}
		
	//if not done typing
	else
		{
			
		draw_char = text_length[page];
		
		}
	
	}




//-------------draw textbox---------------//
var _txtb_x = textbox_x + text_x_offset[page];
var _txtb_y = textbox_y;
//txtb_img += txtb_img_spd;
txtb_spr_w = sprite_get_width(txtb_spr[page]);
txtb_spr_h = sprite_get_height(txtb_spr[page]);

//draw the speaker
if speaker_sprite[page] != noone
	{
	sprite_index = speaker_sprite[page]; 
	if draw_char == text_length[page] {image_index = 0};
	var _speaker_x = textbox_x + portrait_x_offset[page];
	if speaker_side[page] == -1 {_speaker_x += sprite_width-65.4};
	
	
	//draw the speaker
	draw_sprite_ext(txtb_spr[page], txtb_img, textbox_x + portrait_x_offset[page], textbox_y, 1.421875, 1.421875, 0, c_white, 1)//Emotion box size
	draw_sprite_ext(sprite_index, image_index, _speaker_x+8, textbox_y+10, 3, 3, 0, c_white, 1);// _speaker_x+8 and textbox_y+10 emotion's orientation in box
	}
	
	
//back of the textbox
draw_sprite_ext(txtb_spr[page], txtb_img, _txtb_x, _txtb_y, textbox_width/txtb_spr_w, textbox_height/txtb_spr_h, 0, c_white, 1)

for(var c = 0; c < draw_char; c++)
	{
	
	//the text
	draw_text( char_x[c, page] + 15, char_y[c, page] + 5, char[c, page]);
	
	}





//var _drawtext = string_copy(text[page], 1, draw_char);
//draw_text_ext(textbox_x + text_x_offset[page] + border, textbox_y + border, drawtext, line_sep, line_width);