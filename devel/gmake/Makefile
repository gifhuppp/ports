COMMENT=	GNU make

DISTNAME=	make-4.4.1
REVISION=	0
PKGNAME=	g${DISTNAME}
CATEGORIES=	devel
SITES=		${SITE_GNU:=make/}
EXTRACT_SUFX=	.tar.lz

HOMEPAGE=	https://www.gnu.org/software/make/

LIB_DEPENDS=	devel/gettext,-runtime

# GPLv3+
PERMIT_PACKAGE=	Yes

WANTLIB=	c iconv intl pthread

DEBUG_PACKAGES=	${BUILD_PACKAGES}

SEPARATE_BUILD=	Yes
CONFIGURE_STYLE= gnu
CONFIGURE_ARGS= --program-prefix="g" --without-guile
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
MODGNU_CONFIG_GUESS_DIRS= ${WRKSRC}/build-aux

TEST_ENV=	SHELL=$$SHELL

.include <bsd.port.mk>
