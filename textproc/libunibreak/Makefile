COMMENT=		implementation of the line and word breaking

V=			5.1
GH_ACCOUNT=		adah1972
GH_PROJECT=		libunibreak
GH_TAGNAME=		libunibreak_${V:S/./_/}
PKGNAME=		${GH_PROJECT}-${V}

SHARED_LIBS +=  unibreak             1.0      # 5.1

CATEGORIES=		textproc

# Zlib/PNG license
PERMIT_PACKAGE=		Yes


AUTOCONF_VERSION=	2.69
AUTOMAKE_VERSION=	1.16
CONFIGURE_STYLE=	autoreconf

# needs to go online
TEST_IS_INTERACTIVE=	Yes
TEST_DEPENDS=		net/wget

DEBUG_PACKAGES=         ${BUILD_PACKAGES}

.include <bsd.port.mk>
