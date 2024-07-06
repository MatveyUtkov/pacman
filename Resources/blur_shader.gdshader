shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture;

void fragment() {
    vec2 blur_size = vec2(0.005); // Adjust the blur size as needed
    vec4 color = texture(screen_texture, SCREEN_UV);
    color += texture(screen_texture, SCREEN_UV + vec2(blur_size.x, 0.0));
    color += texture(screen_texture, SCREEN_UV + vec2(-blur_size.x, 0.0));
    color += texture(screen_texture, SCREEN_UV + vec2(0.0, blur_size.y));
    color += texture(screen_texture, SCREEN_UV + vec2(0.0, -blur_size.y));
    color += texture(screen_texture, SCREEN_UV + vec2(blur_size.x, blur_size.y));
    color += texture(screen_texture, SCREEN_UV + vec2(-blur_size.x, -blur_size.y));
    color += texture(screen_texture, SCREEN_UV + vec2(blur_size.x, -blur_size.y));
    color += texture(screen_texture, SCREEN_UV + vec2(-blur_size.x, blur_size.y));
    color /= 9.0; // Average the colors
    COLOR = color;
}
