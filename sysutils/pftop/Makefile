# XXX should be fixed to use the new queuing subsystem

COMMENT=	curses-based real time state and rule display for pf

DISTNAME=	pftop-0.7
REVISION=	19
CATEGORIES=	sysutils

HOMEPAGE=	http://www.eee.metu.edu.tr/~canacar/pftop/
# BSD
PERMIT_PACKAGE=	Yes

WANTLIB += c curses

SITES=		http://www.eee.metu.edu.tr/~canacar/

MAKE_FLAGS=	CC="${CC}"
FAKE_FLAGS=	BINDIR=${PREFIX}/sbin MANDIR=${PREFIX}/man/man

.include <bsd.port.mk>
