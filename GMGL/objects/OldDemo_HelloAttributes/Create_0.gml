alarm_set(0,GMGL_ACTIVE_CHECK_TIME * game_get_speed(gamespeed_fps));

draw_enable_drawevent(false);

glfw_init();

glfw_window_hint(GLFW_CONTEXT_VERSION_MAJOR,3);
glfw_window_hint(GLFW_CONTEXT_VERSION_MINOR,3);

gmgl_create_window_centered(800,600,"Demo - Setting up Attributes");

var vertexShader = gl_create_shader(GL_VERTEX_SHADER,vertex_shader_more_attributes());
var fragmentShader = gl_create_shader(GL_FRAGMENT_SHADER,fragment_shader_more_attributes());
program = gl_create_program();
gl_attach_shader(program,vertexShader);
gl_attach_shader(program,fragmentShader);
gl_link_program(program);
gl_delete_shader(vertexShader);
gl_delete_shader(fragmentShader);

var v = [
	//Positions			//Colors
	-0.5,-0.5, 0.0,		1.0, 0.0, 0.0,
	 0.5,-0.5, 0.0,		0.0, 1.0, 0.0,
	 0.0, 0.5, 0.0,		0.0, 0.0, 1.0
];
var vcount = array_length_1d(v);
vbuff = buffer_create(vcount*buffer_sizeof(buffer_u32),buffer_fixed,4);
for (var i = 0; i < vcount; ++i) {
	buffer_write(vbuff,buffer_f32,v[i]);
}

vao = gl_gen_vertex_array();
vbo = gl_gen_buffer();

gl_bind_vertex_array(vao);

gl_bind_buffer(GL_ARRAY_BUFFER,vbo);
gl_buffer_data(GL_ARRAY_BUFFER,buffer_get_size(vbuff),buffer_get_address(vbuff),GL_STATIC_DRAW);

gl_vertex_attrib_pointer(0,3,GMGL_FALSE,6,0);
gl_enable_vertex_attrib_array(0);
gl_vertex_attrib_pointer(1,3,GMGL_FALSE,6,3);
gl_enable_vertex_attrib_array(1);

gl_bind_buffer(GL_ARRAY_BUFFER,0);
gl_bind_vertex_array(0);





