SHARED_LIBS +=  courier-unicode		2.0 # 2.0

COMMENT =		courier unicode library

DISTNAME =		courier-unicode-2.3.1

CATEGORIES =		mail devel

SITES =			${SITE_SOURCEFORGE:=courier/}
EXTRACT_SUFX =		.tar.bz2

HOMEPAGE =		http://www.courier-mta.org/imap/
MAINTAINER =		Giovanni Bechis <giovanni@openbsd.org>

# GPLv3
PERMIT_PACKAGE=	Yes

COMPILER =		base-clang ports-gcc
WANTLIB +=		iconv m ${COMPILER_LIBCXX}
LIB_DEPENDS =		converters/libiconv

USE_GMAKE =		Yes
CONFIGURE_STYLE =	gnu

CONFIGURE_ENV =		LDFLAGS="-L${LOCALBASE}/lib" \
			CXXFLAGS="-I${LOCALBASE}/include" \
			CPPFLAGS="-I${LOCALBASE}/include"

.include <bsd.port.mk>
