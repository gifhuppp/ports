COMMENT =		solitaire games

DISTNAME =		ace-1.4
REVISION =		3

SHARED_LIBS +=  cards                     0.0 # 1.0

CATEGORIES =		games

HOMEPAGE =		http://www.delorie.com/store/ace/

# GPLv2+
PERMIT_PACKAGE =	Yes

WANTLIB =  X11 c m png pthread xcb z

SITES =			http://www.delorie.com/store/ace/

LIB_DEPENDS =		graphics/png

USE_GMAKE =		Yes
CONFIGURE_STYLE =	gnu
CONFIGURE_ENV =		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib" \
			BUILD_CC="${CC}"

.include <bsd.port.mk>
