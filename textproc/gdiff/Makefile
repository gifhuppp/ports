COMMENT=	GNU versions of the diff utilities

VERSION=	3.11
REVISION=	0
EXTRACT_SUFX=	.tar.xz
DISTNAME=	diffutils-${VERSION}
PKGNAME=	gdiff-${VERSION}
CATEGORIES=	textproc
HOMEPAGE=	https://www.gnu.org/software/diffutils/

# GPLv3+
PERMIT_PACKAGE=	Yes

WANTLIB += c iconv intl pthread sigsegv

SITES=		${SITE_GNU:=diffutils/}

LIB_DEPENDS=	devel/gettext,-runtime \
		devel/libsigsegv

CONFIGURE_STYLE= gnu
CONFIGURE_ARGS=	--program-prefix=g
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
MODGNU_CONFIG_GUESS_DIRS= ${WRKSRC}/build-aux

USE_GMAKE =	Yes

# handle --program-prefix: the help-version test runs sdiff which calls
# out to gdiff, but it doesn't have that name until installed.
pre-test:
	cd ${WRKBUILD}/src; ln -fs diff gdiff

TEST_FLAGS=	HOME=/tmp

.include <bsd.port.mk>
