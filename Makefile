#CXX=	c++

# compiler flags.
#CXXFLAGS+=	-I/usr/local/include
#CXXFLAGS+=	-O2 -g3
#CXXFLAGS+=	-pg
#CXXFLAGS+=	-std=gnu++98
#LDFLAGS+=	-lc++ -L/usr/local/lib

# lieonn.hh compile options
#CXXFLAGS+=	-D_ARCFOUR_

# N.B. sed -e s/static\ inline//g | sed -e s/inline//g
#CXXFLAGS+=     -D_OLDCPP_ -ftemplate-depth-99
#LDFLAGS+=	-lm

CLEANFILES= *.o ddpmopt ddpmopt32 p2 p2-32

clean:
	@rm -rf ${CLEANFILES}

all:	ddpmopt ddpmopt32 p2 p2-32
ddpmopt:
	${CXX} ${CXXFLAGS} -static -o ddpmopt ddpmopt.cc
ddpmopt32:
	${CXX} ${CXXFLAGS} -static -D_FLOAT_BITS_=32 -o ddpmopt32 ddpmopt.cc
p2:
	${CXX} ${CXXFLAGS} -static -o p2 p2.cc
p2-32:
	${CXX} ${CXXFLAGS} -static -D_FLOAT_BITS_=32 -o p2-32 p2.cc

