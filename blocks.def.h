#define EXEC(script) 	"~/.dwmblocks/scripts/"script

//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/		/*Update Signal*/
	// {"",     EXEC("tun_ip.sh"), 		5, 						0},
	// {"",     EXEC("speed.sh"), 		1,						0},
  	// {"",     EXEC("updates.sh"), 	(15*60), 				0},
  	// {"",     EXEC("therm.sh"), 		60, 				    0},
	// {"",	    EXEC("music.sh"),		5,						22},
	{" ", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	30,		0},
	{"",	    EXEC("volume.sh"),		0,						23},
	{"",        EXEC("internet.sh"), 	5, 						0},
  	{"", 		EXEC("battery.sh"),     60, 					0},
  	{"", 		EXEC("time.sh"), 		60, 					0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
