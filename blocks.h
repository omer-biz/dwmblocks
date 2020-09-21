#define EXEC(script) 	"~/.dwmblocks/scripts/"script
//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/		/*Update Signal*/
	{"", 		EXEC("tun_ip.sh"), 		5, 						0},
  	{"", 		EXEC("time.sh"), 		60, 					0},
  	{"", 		EXEC("updates.sh"), 	1800, 					0},
	{"",		EXEC("volume.sh"),		0,						23},
	{"", 		EXEC("internet.sh"), 	1, 						0},
	{"", 		EXEC("speed.sh"), 		1,						0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim = '|';
