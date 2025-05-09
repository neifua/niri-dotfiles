#define WALLPAPER "%%wallpaper%%"

static const float rootcolor[]             = COLOR(0x%%color0.hex%%ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0x%%color15.hex%%ff, 0x%%color0.hex%%ff, 0x%%color8.hex%%ff },
	[SchemeSel]  = { 0x%%color15.hex%%ff, 0x%%color2.hex%%ff, 0x%%color1.hex%%ff },
	[SchemeUrg]  = { 0x%%color15.hex%%ff, 0x%%color1.hex%%ff, 0x%%color2.hex%%ff },
};
