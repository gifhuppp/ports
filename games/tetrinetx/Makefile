COMMENT=	tetrinet server

DISTNAME=	tetrinetx-1.13.16+qirc-1.40c
PKGNAME=	tetrinetx-1.13.16
REVISION=	2

CATEGORIES=	games

HOMEPAGE=	https://tetrinetx.sourceforge.net/

SITES=		${SITE_SOURCEFORGE:=tetrinetx/}

# GPLv2
PERMIT_PACKAGE=	Yes
WANTLIB=	c adns

LIB_DEPENDS=	net/adns

WRKSRC=		${WRKDIST}/src

NO_TEST=	Yes

FLAVORS=	ipv6
FLAVOR?=

.if ${FLAVOR:Mipv6}
CFLAGS+=	-DUSE_IPV6
.endif

CFLAGS+=	-fno-strength-reduce -DCONFDIR="\"${SYSCONFDIR}/tetrinetx\""

post-patch:
	rm ${WRKDIST}/bin/game.*${PATCHORIG}

do-build:
	cd ${WRKSRC} && ${CC} ${CFLAGS} -I${LOCALBASE}/include \
	    main.c -o tetrinetx -L${LOCALBASE}/lib -ladns

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/tetrinetx ${PREFIX}/bin
	@${INSTALL_DATA_DIR} ${PREFIX}/share/doc/tetrinetx
	@${INSTALL_DATA} ${WRKDIST}/README* ${PREFIX}/share/doc/tetrinetx
	@${INSTALL_DATA_DIR} ${PREFIX}/share/examples/tetrinetx
	@${INSTALL_DATA} ${WRKDIST}/bin/game.* ${PREFIX}/share/examples/tetrinetx

.include <bsd.port.mk>
