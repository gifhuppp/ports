COMMENT=	decode tcpdump(1) output

DISTNAME=	tcpshow-1.74
REVISION=	0
CATEGORIES=	net security

SITES=		${SITE_FREEBSD_LOCAL:=obrien/}
DISTFILES=	tcpshow.c tcpshow.1

EXTRACT_CASES=	*)cp ${FULLDISTDIR}/$$archive ${WRKDIST};;

PERMIT_PACKAGE=	Yes
WANTLIB=		c

WRKDIST=	${WRKDIR}

do-build:
	cd ${WRKSRC}; ${CC} ${CFLAGS} -DNOETHERNAMES -o tcpshow tcpshow.c

NO_TEST=	Yes

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/tcpshow ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/tcpshow.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
