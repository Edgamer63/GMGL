alarm_set(0,GMGL_ACTIVE_CHECK_TIME * game_get_speed(gamespeed_fps));

draw_enable_drawevent(false);

var scr_width = 800;
var scr_height = 600;

cameraPos = [0,0,-3];
cameraYaw = 90;
cameraPitch = 0;
cameraRoll = 0;
cameraFront = vector_normalize([
	dcos(cameraYaw) * dcos(cameraPitch),
	dsin(cameraPitch),
	dsin(cameraYaw) * dcos(cameraPitch)
]);
cameraUp = [0,1,0];
cameraSpeed = 2.5;
cameraLastX = scr_width / 2;
cameraLastY = scr_height / 2;
cameraFirstMouse = true;

glfw_init();

glfw_window_hint(GLFW_CONTEXT_VERSION_MAJOR,3);
glfw_window_hint(GLFW_CONTEXT_VERSION_MINOR,3);

gmgl_create_window_centered(scr_width,scr_height,"Demo - Using Inputs ( keyboard, mouse and joystick(not implemented yet) )");

gl_enable(GL_DEPTH_TEST);

var vertexShader = gl_create_shader(GL_VERTEX_SHADER,vertex_shader_cube());
var fragmentShader = gl_create_shader(GL_FRAGMENT_SHADER,fragment_shader_cube());
program = gl_create_program();
gl_attach_shader(program,vertexShader);
gl_attach_shader(program,fragmentShader);
gl_link_program(program);
gl_delete_shader(vertexShader);
gl_delete_shader(fragmentShader);

var vertices = [
	//Positions			//UV
	-0.5, -0.5, -0.5,  0.0, 0.0,
	 0.5, -0.5, -0.5,  1.0, 0.0,
	 0.5,  0.5, -0.5,  1.0, 1.0,
	 0.5,  0.5, -0.5,  1.0, 1.0,
	-0.5,  0.5, -0.5,  0.0, 1.0,
	-0.5, -0.5, -0.5,  0.0, 0.0,

	-0.5, -0.5,  0.5,  0.0, 0.0,
	 0.5, -0.5,  0.5,  1.0, 0.0,
	 0.5,  0.5,  0.5,  1.0, 1.0,
	 0.5,  0.5,  0.5,  1.0, 1.0,
	-0.5,  0.5,  0.5,  0.0, 1.0,
	-0.5, -0.5,  0.5,  0.0, 0.0,

	-0.5,  0.5,  0.5,  1.0, 0.0,
	-0.5,  0.5, -0.5,  1.0, 1.0,
	-0.5, -0.5, -0.5,  0.0, 1.0,
	-0.5, -0.5, -0.5,  0.0, 1.0,
	-0.5, -0.5,  0.5,  0.0, 0.0,
	-0.5,  0.5,  0.5,  1.0, 0.0,

	 0.5,  0.5,  0.5,  1.0, 0.0,
	 0.5,  0.5, -0.5,  1.0, 1.0,
	 0.5, -0.5, -0.5,  0.0, 1.0,
	 0.5, -0.5, -0.5,  0.0, 1.0,
	 0.5, -0.5,  0.5,  0.0, 0.0,
	 0.5,  0.5,  0.5,  1.0, 0.0,

	-0.5, -0.5, -0.5,  0.0, 1.0,
	 0.5, -0.5, -0.5,  1.0, 1.0,
	 0.5, -0.5,  0.5,  1.0, 0.0,
	 0.5, -0.5,  0.5,  1.0, 0.0,
	-0.5, -0.5,  0.5,  0.0, 0.0,
	-0.5, -0.5, -0.5,  0.0, 1.0,

	-0.5,  0.5, -0.5,  0.0, 1.0,
	 0.5,  0.5, -0.5,  1.0, 1.0,
	 0.5,  0.5,  0.5,  1.0, 0.0,
	 0.5,  0.5,  0.5,  1.0, 0.0,
	-0.5,  0.5,  0.5,  0.0, 0.0,
	-0.5,  0.5, -0.5,  0.0, 1.0
];

var vcount = array_length_1d(vertices);
vbuff = buffer_create(vcount*buffer_sizeof(buffer_u32),buffer_fixed,4);
for (var i = 0; i < vcount; ++i) {
	buffer_write(vbuff,buffer_f32,vertices[i]);
}

vao = gl_gen_vertex_array();
vbo = gl_gen_buffer();

gl_bind_vertex_array(vao);

gl_bind_buffer(GL_ARRAY_BUFFER,vbo);
gl_buffer_data(GL_ARRAY_BUFFER,buffer_get_size(vbuff),buffer_get_address(vbuff),GL_STATIC_DRAW);

gl_vertex_attrib_pointer(0,3,GL_FLOAT,GMGL_FALSE,5,0);
gl_enable_vertex_attrib_array(0);
gl_vertex_attrib_pointer(1,2,GL_FLOAT,GMGL_FALSE,5,3);
gl_enable_vertex_attrib_array(1);

texture1 = gl_gen_texture();
gl_bind_texture(GL_TEXTURE_2D, texture1);
gl_tex_parameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
gl_tex_parameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
gl_tex_parameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
gl_tex_parameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

var image = gmgl_load_image("container.jpg");
gl_texImage2D(GL_TEXTURE_2D, 0, GL_RGB, 0, GL_RGB, GL_UNSIGNED_BYTE, image);
gl_generate_mipmap(GL_TEXTURE_2D);
gmgl_free_image(image);

texture2 = gl_gen_texture();
gl_bind_texture(GL_TEXTURE_2D, texture2);
gl_tex_parameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
gl_tex_parameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
gl_tex_parameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
gl_tex_parameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

image = gmgl_load_image("awesomeface.png");
gl_texImage2D(GL_TEXTURE_2D, 0, GL_RGB, 0, GL_RGBA, GL_UNSIGNED_BYTE, image);
gl_generate_mipmap(GL_TEXTURE_2D);
gmgl_free_image(image);

gl_bind_buffer(GL_ARRAY_BUFFER,0);
gl_bind_vertex_array(0);


gl_use_program(program);
gl_uniform1i(gl_get_uniform_location(program,"texture1"), 0);
gl_uniform1i(gl_get_uniform_location(program,"texture2"), 1);
uModel = gl_get_uniform_location(program,"model");
uView = gl_get_uniform_location(program,"view");
uProj = gl_get_uniform_location(program,"projection");

modelMatrixBuffer = buffer_create(16*buffer_sizeof(buffer_f32),buffer_fixed,4);

//view = gmgl_matrix_build_lookat(cameraPos,vector_add(cameraPos,cameraFront),cameraUp);
view = gmgl_matrix_build_lookat(cameraPos,vector_add(cameraPos,cameraFront),cameraUp);
viewMatrixBuffer = buffer_create(16*buffer_sizeof(buffer_f32),buffer_fixed,4);
buffer_seek(viewMatrixBuffer,buffer_seek_start,0);
for (var i = 0; i < 16; ++i) {
	buffer_write(viewMatrixBuffer,buffer_f32,view[i]);
}

proj = matrix_build_projection_perspective_fov(45,scr_width/scr_height,0.1,1000.0);
projMatrixBuffer = buffer_create(16*buffer_sizeof(buffer_f32),buffer_fixed,4);
buffer_seek(projMatrixBuffer,buffer_seek_start,0);
for (var i = 0; i < 16; ++i) {
	buffer_write(projMatrixBuffer,buffer_f32,proj[i]);
}


modelPositions = [
	[0,0,0],
	[2,5,-15],
	[-1.5,-2.2,-2.5],
	[-3.8,-2,-12.3],
	[2.4,-0.4,-3.5],
	[-1.7,3,-7.5],
	[1.3,-2,-2.5],
	[1.5,2,-2.5],
	[1.5,0.2,-1.5],
	[-1.3,1,-1.5]
];