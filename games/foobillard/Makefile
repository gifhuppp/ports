COMMENT =		OpenGL billard game

DISTNAME =		foobillard-3.0a
REVISION =		2

CATEGORIES =		games x11
HOMEPAGE =		https://foobillard.sourceforge.net/

# GPLv2
PERMIT_PACKAGE =	Yes

WANTLIB += GL GLU ICE SDL SM Xaw Xi c freetype m png pthread z

SITES =			${SITE_SOURCEFORGE:=foobillard/}

LIB_DEPENDS =		graphics/png \
			devel/sdl

USE_GMAKE =		Yes
CONFIGURE_STYLE =	gnu
CONFIGURE_ARGS =	--enable-nvidia=no
CFLAGS += 		-DNO_NV_BUMPREF

.include <bsd.port.mk>
