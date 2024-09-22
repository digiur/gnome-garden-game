shader_type canvas_item;

uniform vec2 scroll = vec2(0.0);

void fragment(){
	vec2 newuv = UV;
	newuv += scroll;
	vec4 c = texture(TEXTURE, newuv);
	COLOR = c;
}