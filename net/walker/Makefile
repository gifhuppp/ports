COMMENT=	retrieve DNS zone via DNSSEC NXT/NSEC traversal

DISTNAME=	walker-3.8

CATEGORIES=	net

HOMEPAGE=	http://josefsson.org/walker/

# GPLv2+
PERMIT_PACKAGE=	Yes

SITES=		${HOMEPAGE}releases/

RUN_DEPENDS=	net/p5-Net-DNS \
		net/p5-Net-DNS-SEC

NO_BUILD=	Yes
NO_TEST=	Yes

PKG_ARCH=	*

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/walker ${PREFIX}/bin/
	${INSTALL_MAN} ${WRKSRC}/walker.1 ${PREFIX}/man/man1/

.include <bsd.port.mk>
