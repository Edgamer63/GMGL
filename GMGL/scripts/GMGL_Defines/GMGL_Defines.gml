#macro GMGL_TRUE 1
#macro GMGL_FALSE 0

#macro GMGL_ARRAY_BUFFER 0x8892
#macro GMGL_ELEMENT_ARRAY_BUFFER 0x8893

#macro GMGL_CONTEXT_VERSION_MAJOR	0x00022002
#macro GMGL_CONTEXT_VERSION_MINOR	0x00022003
#macro GMGL_OPENGL_PROFILE			0x00022008

#macro GMGL_OPENGL_ANY_PROFILE		0
#macro GMGL_OPENGL_CORE_PROFILE		0x00032001
#macro GMGL_OPENGL_COMPAT_PROFILE	0x00032002

#macro GMGL_COMPUTE_SHADER 0x91B9
#macro GMGL_VERTEX_SHADER 0x8B31
#macro GMGL_TESS_CONTROL_SHADER 0x8E88
#macro GMGL_TESS_EVALUATION_SHADER 0x8E87
#macro GMGL_GEOMETRY_SHADER 0x8DD9
#macro GMGL_FRAGMENT_SHADER 0x8B30

#macro GMGL_TRIANGLES 0x0004

#macro GMGL_STATIC_DRAW 0x88E4

#macro GMGL_TEXTURE_2D 0x0DE1

#macro GMGL_TEXTURE_WRAP_S 0x2802
#macro GMGL_TEXTURE_WRAP_T 0x2803
#macro GMGL_TEXTURE_MIN_FILTER 0x2801
#macro GMGL_TEXTURE_MAG_FILTER 0x2800

#macro GMGL_REPEAT 0x2901
#macro GMGL_LINEAR 0x2601

#macro GMGL_RGB 0x1907
#macro GMGL_RGBA 0x1908

#macro GMGL_TEXTURE0 0x84C0
#macro GMGL_TEXTURE1 0x84C1
#macro GMGL_TEXTURE2 0x84C2
#macro GMGL_TEXTURE3 0x84C3
#macro GMGL_TEXTURE4 0x84C4
#macro GMGL_TEXTURE5 0x84C5
#macro GMGL_TEXTURE6 0x84C6
#macro GMGL_TEXTURE7 0x84C7
#macro GMGL_TEXTURE8 0x84C8
#macro GMGL_TEXTURE9 0x84C9
#macro GMGL_TEXTURE10 0x84CA
#macro GMGL_TEXTURE11 0x84CB
#macro GMGL_TEXTURE12 0x84CC
#macro GMGL_TEXTURE13 0x84CD
#macro GMGL_TEXTURE14 0x84CE
#macro GMGL_TEXTURE15 0x84CF

/*
glTexParameteri(GMGL_TEXTURE_2D, GMGL_TEXTURE_WRAP_S, GMGL_REPEAT);
glTexParameteri(GMGL_TEXTURE_2D, GMGL_TEXTURE_WRAP_T, GMGL_REPEAT);
glTexParameteri(GMGL_TEXTURE_2D, GMGL_TEXTURE_MIN_FILTER, GMGL_LINEAR);
glTexParameteri(GMGL_TEXTURE_2D, GMGL_TEXTURE_MAG_FILTER, GMGL_LINEAR);
*/