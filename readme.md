# GMGL
## GLFW wrapper for Gamemaker Studio

---

This is an extension for Gamemaker Studio that wraps GLFW and OpenGL functions.

GMS only uses OpenGL ES 2.0 while this will allow you to use any version.

I plan on adding every function but at the moment this only has the functions necessary to follow along with the tutorials found at [learnopengl.com](https://www.learnopengl.com).

This extension is a W.I.P. so I don't recommend using this for anything serious. But it's fun to mess around with and I could really use some more experienced OpenGL programmers who can point out the more important functions. Otherwise it's just a matter of me learning about something I need and implementing it.

Also if you're familiar with C++ you can check out the source code. It's pretty simple to follow the same pattern I've been going with when wrapping functions.

---

![alt text](https://i.imgur.com/50QnrND.gif,"")

### Currently Implemented Functions
```
double      gmgl_is_active() 
double      gmgl_load_image(const char* path, double flipOnLoad) 
void        gmgl_free_image(double imageIndex) 
double      gmgl_get_image_width(double image) 
double      gmgl_get_image_height(double image) 
double      gmgl_get_image_channel_num(double image)

double      glfw_init() 
void        glfw_update() 
void        glfw_terminate() 
double      glfw_create_window(double width, double height, const char* title) 
void        glfw_default_window_hints() 
void        glfw_window_hint(double hint, double value) 
void        glfw_set_window_title(char* title) 
void        glfw_set_window_icon(const char* path) 
double      glfw_get_window_x() 
double      glfw_get_window_y() 
void        glfw_set_window_pos(double x, double y) 
double      glfw_get_window_width() 
double      glfw_get_window_height() 
void        glfw_set_window_size_limits(double minwidth, double minheight, double maxwidth, double maxheight) 
void        glfw_set_window_aspect_ratio(double numer, double denom) 
void        glfw_set_window_size(double width, double height) 
double      glfw_get_framebuffer_width() 
double      glfw_get_framebuffer_height() 
void        glfw_iconify_window() 
void        glfw_restore_window() 
void        glfw_maximize_window() 
void        glfw_show_window() 
void        glfw_hide_window() 
void        glfw_focus_window() 
double      glfw_get_window_attrib(double attrib) 
void        glfw_poll_events() 
void        glfw_wait_events() 
void        glfw_wait_events_timeout(double timeout) 
void        glfw_post_empty_event() 
void        glfw_swap_buffers() 
void        glfw_set_input_mode(double mode, double value) 
double      glfw_get_input_mode(double mode) 
const char* glfw_get_key_name(double key, double scancode) 
double      glfw_get_key(double key) 
double      glfw_get_mouse_button(double button) 
double      glfw_get_mouse_x() 
double      glfw_get_mouse_y() 
void        glfw_set_mouse_pos(double x, double y) 
void        glfw_set_clipboard_string(const char* string) 
const char* glfw_get_clipboard_string() 
double      glfw_get_time() 
void        glfw_set_time(double time) 

void        gl_viewport(double x, double y, double width, double height) 
void        gl_enable(double cap) 
void        gl_disable(double cap) 
void        gl_polygon_mode(double face, double mode) 
void        gl_depth_mask(double flag) 
void        gl_depth_func(double func) 
void        gl_stencil_mask(double mask) 
void        gl_stencil_func(double func, double ref, double mask) 
void        gl_stencil_op(double fail, double zfail, double zpass) 
void        gl_blend_func(double sfactor, double dfactor) 
void        gl_blend_func_separate(double sfactorRGB, double dfactorRGB, double sfactorAlpha, double dfactorAlpha) 
void        gl_blend_equation(double mode) 
void        gl_cull_face(double mode) 
void        gl_front_face(double mode) 
void        gl_clear_color(double r, double g, double b, double a) 
void        gl_clear(double mask) 
void        gl_draw_arrays(double mode, double first, double count) 
void        gl_draw_elements(double mode, double count) 
double      gl_gen_buffer() 
void        gl_bind_buffer(double target, double bufferIndex) 
void        gl_delete_buffer(double bufferIndex) 
void        gl_buffer_data(double target, double size, void* vertices, double usage) 
double      gl_gen_vertex_array() 
void        gl_bind_vertex_array(double varrayIndex) 
void        gl_delete_vertex_array(double varrayIndex) 
void        gl_vertex_attrib_pointer(double index, double size, double type, double normalized, double stride, double offset) 
void        gl_enable_vertex_attrib_array(double index) 
double      gl_gen_texture() 
void        gl_bind_texture(double target, double textureIndex) 
void        gl_delete_texture(double textureIndex) 
void        gl_active_texture(double unit) 
void        gl_tex_image2D(double target, double level, double internalformat, double width, double height, double border, double format, double type, double imageIndex) 
void        gl_generate_mipmap(double target) 
double      gl_gen_framebuffer() 
void        gl_bind_framebuffer(double target, double framebufferIndex) 
void        gl_delete_framebuffer(double framebufferIndex) 
void        gl_framebuffer_texture2D(double target, double attachment, double textarget, double textureIndex, double level) 
double      gl_gen_renderbuffer() 
void        gl_bind_renderbuffer(double target, double renderbufferIndex) 
void        gl_renderbuffer_storage(double target, double internalFormat, double width, double height) 
void        gl_framebuffer_renderbuffer(double target, double attachment, double renderbufferTarget, double renderbufferIndex) 
double      gl_check_framebuffer_status(double target) 
double      gl_create_shader(double type, char* source) 
void        gl_delete_shader(double shaderIndex) 
double      gl_create_program() 
void        gl_attach_shader(double programIndex, double shaderIndex) 
void        gl_link_program(double programIndex) 
void        gl_use_program(double programIndex) 
double      gl_get_uniform_location(double programIndex, const char* name) 
void        gl_uniform1f(double location, double x) 
void        gl_uniform2f(double location, double x, double y) 
void        gl_uniform3f(double location, double x, double y, double z) 
void        gl_uniform4f(double location, double x, double y, double z, double w) 
void        gl_uniform1i(double location, double x) 
void        gl_uniform2i(double location, double x, double y) 
void        gl_uniform3i(double location, double x, double y, double z) 
void        gl_uniform4i(double location, double x, double y, double z, double w) 
void        gl_uniform1ui(double location, double x) 
void        gl_uniform2ui(double location, double x, double y) 
void        gl_uniform3ui(double location, double x, double y, double z) 
void        gl_uniform4ui(double location, double x, double y, double z, double w) 
void        gl_uniform1fv(double location, double size, void* value) 
void        gl_uniform2fv(double location, double size, void* value) 
void        gl_uniform3fv(double location, double size, void* value) 
void        gl_uniform4fv(double location, double size, void* value) 
void        gl_uniform1iv(double location, double size, void* value) 
void        gl_uniform2iv(double location, double size, void* value) 
void        gl_uniform3iv(double location, double size, void* value) 
void        gl_uniform4iv(double location, double size, void* value) 
void        gl_uniform1uiv(double location, double size, void* value) 
void        gl_uniform2uiv(double location, double size, void* value) 
void        gl_uniform3uiv(double location, double size, void* value) 
void        gl_uniform4uiv(double location, double size, void* value) 
void        gl_uniform_mat2fv(double location, double count, double transpose, void* value) 
void        gl_uniform_mat3fv(double location, double count, double transpose, void* value) 
void        gl_uniform_mat4fv(double location, double count, double transpose, void* value) 
void        gl_uniform_mat2x3fv(double location, double count, double transpose, void* value) 
void        gl_uniform_mat3x2fv(double location, double count, double transpose, void* value) 
void        gl_uniform_mat2x4fv(double location, double count, double transpose, void* value) 
void        gl_uniform_mat4x2fv(double location, double count, double transpose, void* value) 
void        gl_uniform_mat3x4fv(double location, double count, double transpose, void* value) 
void        gl_uniform_mat4x3fv(double location, double count, double transpose, void* value) 
void        gl_tex_parameterf(double target, double pname, double param) 
void        gl_tex_parameteri(double target, double pname, double param) 
void        gl_texture_parameterf(double textureIndex, double pname, double param) 
void        gl_texture_parameteri(double textureIndex, double pname, double param) 
void        gl_tex_parameterfv(double target, double pname, void* param) 
void        gl_tex_parameteriv(double target, double pname, void* param) 
void        gl_texture_parameterfv(double textureIndex, double pname, void* param) 
void        gl_texture_parameteriv(double textureIndex, double pname, void* param) 
void        gl_tex_parameterIiv(double target, double pname, void* param) 
void        gl_tex_parameterIuiv(double target, double pname, void* param) 
void        gl_texture_parameterIiv(double textureIndex, double pname, void* param) 
void        gl_texture_parameterIuiv(double textureIndex, double pname, void* param) 
```