COMMENT =		simple utilities for manipulating HTML and XML files

DISTNAME =		html-xml-utils-8.7

CATEGORIES =		textproc

HOMEPAGE =		https://www.w3.org/Tools/HTML-XML-utils/

MAINTAINER =		Anthony J. Bentley <anthony@anjbe.name>

# W3C license
PERMIT_PACKAGE =	Yes

WANTLIB += c curl iconv idn

SITES =			https://www.w3.org/Tools/HTML-XML-utils/

LIB_DEPENDS =		converters/libiconv \
			devel/libidn \
			net/curl

CONFIGURE_STYLE =	gnu
CONFIGURE_ARGS +=	--with-libidn=${LOCALBASE}

.include <bsd.port.mk>
