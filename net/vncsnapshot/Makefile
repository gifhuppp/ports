COMMENT=		connect to VNC server and save screen images

V=			1.2a
PORTROACH=		ignore:1
DISTNAME=		vncsnapshot-$V-src
PKGNAME=		vncsnapshot-$V
REVISION =		4

CATEGORIES=		net

HOMEPAGE=		https://vncsnapshot.sourceforge.net/

# GPL
PERMIT_PACKAGE=	Yes

LIB_DEPENDS=		graphics/jpeg

WANTLIB += c m ${COMPILER_LIBCXX} z jpeg

COMPILER =		base-clang ports-gcc base-gcc

SITES=			${SITE_SOURCEFORGE:=vncsnapshot/}

MAKE_FLAGS=		CC="${CC}" CXX="${CXX}"

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/vncsnapshot ${PREFIX}/bin
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/vncsnapshot
	${INSTALL_DATA} ${WRKSRC}/README ${PREFIX}/share/doc/vncsnapshot

WRKDIST=		${WRKDIR}/vncsnapshot-$V

NO_TEST=		Yes

.include <bsd.port.mk>
