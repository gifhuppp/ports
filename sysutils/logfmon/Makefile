COMMENT=		log file monitoring daemon

V=			1.2
DISTNAME=		logfmon-$V
CATEGORIES=		sysutils

HOMEPAGE=		https://github.com/nicm/logfmon

MAINTAINER=		Tom Doherty <tom@singlesecond.com>

# ISC
PERMIT_PACKAGE=	Yes

WANTLIB=		c pthread

SITES=			https://github.com/nicm/logfmon/releases/download/$V/

CONFIGURE_STYLE=	gnu

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/logfmon
	${INSTALL_DATA} ${WRKSRC}/examples/* ${PREFIX}/share/examples/logfmon

.include <bsd.port.mk>
