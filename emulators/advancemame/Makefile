BROKEN-powerpc =	clang-10 hangs indefinitely

COMMENT =	MAME port with advanced video support for monitors and TVs

V =		5.0
DISTNAME =	advancemame-$V

CATEGORIES =	emulators games

HOMEPAGE =	https://www.advancemame.it/

# GPLv2+ and MAME License
PERMIT_PACKAGE =	unclear license
PERMIT_DISTFILES =	unclear license

COMPILER =		base-clang ports-gcc
COMPILER_LANGS =	c

WANTLIB +=	SDL2 c expat freetype m pthread z

SITES =		https://github.com/amadvance/advancemame/releases/download/v$V/

LIB_DEPENDS =	devel/sdl2

CONFIGURE_STYLE = gnu
CONFIGURE_ARGS = --disable-asm

# XXX - the port doesn't respect CXXFLAGS and its build system is a mess.
CFLAGS +=	-D_LIBCPP_ENABLE_CXX17_REMOVED_UNARY_BINARY_FUNCTION

USE_GMAKE =	Yes

post-patch:
	@sed -i 's,@@,@,' ${WRKSRC}/Makefile.in

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/obj/mame/generic/blend/advmame ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/obj/mess/generic/blend/advmess ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/doc/advmame.1 ${PREFIX}/man/man1
	${INSTALL_DATA} ${WRKSRC}/doc/advmame.1 ${PREFIX}/man/man1/advmess.1
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/advancemame
	${INSTALL_DATA} ${WRKSRC}/doc/advmame.txt ${PREFIX}/share/doc/advancemame

.include <bsd.port.mk>
