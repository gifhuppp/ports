COMMENT=	GNU cpio copies files to and from archives

DISTNAME=	cpio-2.15
PKGNAME=	g${DISTNAME}
CATEGORIES=	archivers
HOMEPAGE=	https://www.gnu.org/software/cpio/
REVISION=	0

MAINTAINER=	Christian Weisgerber <naddy@openbsd.org>

# GPLv3
PERMIT_PACKAGE=	Yes

SITES=		${SITE_GNU:=cpio/}
EXTRACT_SUFX=	.tar.bz2

LIB_DEPENDS=	devel/gettext,-runtime
WANTLIB=	c iconv intl pthread

CONFIGURE_STYLE=gnu
CONFIGURE_ARGS=	--program-prefix="g" \
		--with-rmt=/etc/rmt
MODGNU_CONFIG_GUESS_DIRS=${WRKSRC}/build-aux

DEBUG_PACKAGES=	${BUILD_PACKAGES}

# autom4te
AUTOCONF_VERSION=2.71
TEST_DEPENDS=	${MODGNU_AUTOCONF_DEPENDS}
TEST_ENV=	AUTOCONF_VERSION=${AUTOCONF_VERSION}

.include <bsd.port.mk>
