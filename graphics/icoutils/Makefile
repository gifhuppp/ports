COMMENT =		extractor and converter for .ico and .cur files

DISTNAME =		icoutils-0.32.3
REVISION =		1

CATEGORIES =		graphics

HOMEPAGE =		https://www.nongnu.org/icoutils/

# GPLv3+
PERMIT_PACKAGE =	Yes

WANTLIB =  c iconv intl m png pthread z

SITES =			http://savannah.nongnu.org/download/icoutils/

EXTRACT_SUFX =		.tar.bz2

LIB_DEPENDS =		devel/gettext,-runtime \
			graphics/png

CONFIGURE_STYLE =	gnu
CONFIGURE_ENV =		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
