COMMENT =		library for manipulating IPTC metadata

DISTNAME =		libiptcdata-1.0.4
REVISION =		4

SHARED_LIBS +=  iptcdata             0.0      # 3.3

CATEGORIES =		graphics

HOMEPAGE =		https://libiptcdata.sourceforge.net/

# LGPLv2
PERMIT_PACKAGE =	Yes

WANTLIB =  c iconv intl pthread

SITES =			${SITE_SOURCEFORGE:=libiptcdata/}

LIB_DEPENDS =		devel/gettext,-runtime

CONFIGURE_STYLE =	gnu

.include <bsd.port.mk>
