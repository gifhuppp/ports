COMMENT=	create/update ZIP files compatible with PKZip(tm)

VERSION=	3.0
REVISION=	3
DISTNAME=	zip${VERSION:S/.//}
PKGNAME=	zip-${VERSION}

CATEGORIES=	archivers

HOMEPAGE=	https://infozip.sourceforge.net/

# Conditional
PERMIT_PACKAGE=	Yes

WANTLIB += c

SITES=		${SITE_SOURCEFORGE:=infozip/}

MAKE_FLAGS=	CC="${CC}" CFLAGS_NOOPT="${CFLAGS} -I. -DUNIX"

MAKE_FILE=	unix/Makefile
ALL_TARGET=	generic
NO_TEST=	Yes

do-install:
.for prog in zip zipcloak zipnote zipsplit
	${INSTALL_PROGRAM} ${WRKBUILD}/${prog} ${PREFIX}/bin
	${INSTALL_MAN} ${WRKDIST}/man/${prog}.1 ${PREFIX}/man/man1
.endfor

.include <bsd.port.mk>
