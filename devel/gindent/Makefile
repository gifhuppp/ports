COMMENT=	GNU utility to indent C source files

DISTNAME=	indent-2.2.10
PKGNAME=	g${DISTNAME}
REVISION=	3
CATEGORIES=	devel

HOMEPAGE=	https://www.gnu.org/software/indent/

# GPLv3+
PERMIT_PACKAGE=	Yes

WANTLIB += c pthread

SITES=		${SITE_GNU:=indent/}

NO_TEST=	Yes
BUILD_DEPENDS=	devel/gettext,-runtime \
		textproc/texi2html
CONFIGURE_STYLE= gnu
CONFIGURE_ARGS=	--program-prefix="g" \
		--without-included-gettext
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
MODGNU_CONFIG_GUESS_DIRS=${WRKSRC}/config
MAKE_ARGS=	BERKELEY_DEFAULTS=1

FAKE_FLAGS+=	docdir=${PREFIX}/share/doc/gindent/

.include <bsd.port.mk>
