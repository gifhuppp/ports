COMMENT=	small & simple FAX send/receive program

DISTNAME=	efax-0.9
REVISION=	4
CATEGORIES=	comms

MAINTAINER=	Ian Darwin <ian@openbsd.org>

PERMIT_PACKAGE=	Yes

WANTLIB=		c

SITES=		${SITE_SUNSITE:=apps/serialcomm/fax/}

MAKE_FLAGS=	CC="${CC}" CFLAGS="${CFLAGS}"

NO_TEST=	Yes

do-install:
	cd ${WRKBUILD}; \
		${INSTALL_PROGRAM} efax efix ${PREFIX}/bin; \
		${INSTALL_SCRIPT} fax ${PREFIX}/bin; \
		${INSTALL_MAN} fax.1 efax.1 efix.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
