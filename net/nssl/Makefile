COMMENT=		netcat-like program with transparent SSL support

DISTNAME=		nssl.005
PKGNAME=		nssl-005
REVISION=		5
CATEGORIES=		net
FIX_EXTRACT_PERMISSIONS=Yes

HOMEPAGE=		https://nssl.sourceforge.net/

# None
PERMIT_PACKAGE=		No
PERMIT_DISTFILES=	No

WANTLIB=		crypto ssl c

SITES=			${SITE_SOURCEFORGE:=nssl/}
EXTRACT_SUFX=		.tgz

NO_TEST=		Yes

WRKDIST=		${WRKDIR}/nssl

do-install:
	${INSTALL_PROGRAM} ${WRKBUILD}/nssl ${PREFIX}/bin/
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/nssl/
	${INSTALL_DATA} ${WRKSRC}/readme.txt ${PREFIX}/share/doc/nssl/

.include <bsd.port.mk>
