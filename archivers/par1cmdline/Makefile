COMMENT=	command line implementation of the PAR v1.0 specification
DISTNAME=	par-v1.1
PKGNAME=	par1cmdline-1.1
CATEGORIES=	archivers
SITES=		${SITE_SOURCEFORGE:=parchive/}

HOMEPAGE=	https://parchive.sourceforge.net/

# GPL
PERMIT_PACKAGE=	Yes

REVISION =	3
WANTLIB=		c

NO_TEST=	Yes

WRKDIST=${WRKDIR}/par-cmdline

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/par1cmdline
	${INSTALL_PROGRAM} ${WRKSRC}/par ${PREFIX}/bin/par1
	${INSTALL_DATA} ${WRKSRC}/README ${PREFIX}/share/doc/par1cmdline

.include <bsd.port.mk>
