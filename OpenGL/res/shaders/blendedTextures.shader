#shader vertex
#version 330 core 

layout(location = 0) in vec4 a_position;
layout(location = 1) in vec2 a_texCoord;

out vec2 v_texCoord;

uniform mat4 u_MVP;

void main()
{
	gl_Position = u_MVP * a_position;
	v_texCoord = a_texCoord;
};

//---------------------------------------

#shader fragment
#version 330 core

in vec2 v_texCoord;
in vec3 v_color;

layout(location = 0) out vec4 gl_FragColor;

uniform sampler2D u_textureA;
uniform sampler2D u_textureB;
uniform float u_blendAmt;

void main()
{
	vec4 colA = texture(u_textureA, v_texCoord);
	vec4 colB = texture(u_textureB, v_texCoord);
	gl_FragColor = mix(colA, colB, u_blendAmt);
};
