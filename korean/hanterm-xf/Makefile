COMMENT=	X Hangul Terminal (XFree86 xterm Based)

V=		2.0.6-177
DISTNAME=	hanterm-xf-$V
DISTFILES=	1761-${DISTNAME}${EXTRACT_SUFX}
CATEGORIES=	korean
PKGNAME=	hanterm-xf-${V:S/-/./}
REVISION=	7
EPOCH=		0

SITES=		https://kldp.net/hanterm-xf/release/
HOMEPAGE=	https://hanterm-xf.kldp.net

PERMIT_PACKAGE=	Yes

WANTLIB += ICE SM X11 Xaw Xext Xmu Xt c curses iconv util

LIB_DEPENDS=	converters/libiconv
NO_TEST=	Yes 

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV+=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib -liconv"
# Force check for openpty(3) in libutil
CONFIGURE_ENV+=	ac_cv_func_grantpt=no

CONFIGURE_ARGS=	--enable-box-char \
		--enable-ansi-color \
		--enable-256-color \
		--enable-tcap-query

post-build:
	iconv -f EUC-KR -t UTF-8 ${WRKSRC}/hanterm.man > ${WRKBUILD}/hanterm.1

post-install:
	${INSTALL_MAN} ${WRKBUILD}/hanterm.1 ${PREFIX}/man/man1/

.include <bsd.port.mk>
