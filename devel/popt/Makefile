COMMENT=	getopt(3)-like library with a number of enhancements

DISTNAME=	popt-1.16
CATEGORIES=	devel
SITES=		http://ftp.rpm.org/mirror/popt/
REVISION=	4

SHARED_LIBS=	popt	1.0

# MIT
PERMIT_PACKAGE=	Yes

WANTLIB=  iconv intl pthread

LIB_DEPENDS=	devel/gettext,-runtime

USE_GMAKE=	Yes
SEPARATE_BUILD=	Yes
CONFIGURE_STYLE= gnu
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
