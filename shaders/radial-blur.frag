#pragma header

//https://github.com/bbpanzu/FNF-Sunday/blob/main/source_sunday/RadialBlur.hx
//https://www.shadertoy.com/view/XsfSDs

//FIXED BY NE_EO

uniform float cx = 0.5; //center x (0.0 - 1.0)
uniform float cy = 0.5; //center y (0.0 - 1.0)
uniform float blurWidth = 0.3; // blurAmount 

const int nsamples = 15; //samples
	
void main() {
	vec2 uv = openfl_TextureCoordv.xy;
	vec4 color = texture2D(bitmap, uv);
	vec2 center = vec2(cx, cy);

	float precompute = 1.0 / float(nsamples - 1);
	uv -= center;
	
	for(int i = 0; i < nsamples; i++) {
		float scale = 1.0 - blurWidth * (float(i) * precompute);
		color += texture2D(bitmap, uv * scale + center);
	}
	color /= float(nsamples);
	gl_FragColor = color; 
}