CC = g++
CCSW = -O2 -Wall
PLATFORM = `uname`

Debug: lander
	cp lander bin/Debug/lander
	chmod +x bin/Debug/lander

Release: lander
	cp lander bin/Release/lander
	chmod +x bin/Release/lander

lander: lander.o lander_graphics.o
	@if [ ${PLATFORM} = "Linux" ]; \
	then $(CC) -o lander lander.o lander_graphics.o ${CCSW} -lGL -lGLU -lglut; \
	echo Linking for Linux; \
	elif [ ${PLATFORM} = "Darwin" ]; \
	then $(CC) -o lander lander.o lander_graphics.o ${CCSW} -framework GLUT -framework OpenGL; \
	echo Linking for Mac OS X; \
	else $(CC) -o lander lander.o lander_graphics.o ${CCSW} -lglut32 -lglu32 -lopengl32; \
	echo Linking for Cygwin; \
	fi

lander_graphics.o lander.o: lander.h

.cpp.o:
	$(CC) ${CCSW} -c $<

clean:
	echo cleaning up; /bin/rm -f core *.o lander

all:	lander
