depth = -9999;

//Textbox parameters
textbox_width = 300
textbox_height = 90;
border = 0;
line_sep = 20;
line_width = textbox_width - border*2 - 30;
txtb_spr[0] = sTextbox;
txtb_img = 0;
text_x_offset[0] = 0; 

//the text
page = 0;
page_number = 0;
text[0] = "";
text_length[0] = string_length(text[0]);

char[0, 0] = "";
char_x[0, 0] = 0;
char_y[0, 0] = 0;

draw_char = 0;
text_spd = 1;

setup = false;

//effects
SetDefaultsForText();
last_free_space = 0;

text_pause_timer = 0;
text_pause_time = 16;