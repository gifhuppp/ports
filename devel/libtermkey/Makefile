COMMENT =	library for processing of keyboard entry from a terminal
DISTNAME =	libtermkey-0.22

SHARED_LIBS +=	termkey		0.2 # 15.2

CATEGORIES =	devel
HOMEPAGE =	http://www.leonerd.org.uk/code/libtermkey/

# MIT
PERMIT_PACKAGE =	Yes

WANTLIB +=	unibilium

SITES =		${HOMEPAGE}

LIB_DEPENDS =	devel/unibilium

USE_GMAKE =	Yes

MAKE_FLAGS =	PREFIX=${PREFIX} \
		MANDIR=${PREFIX}/man

.include <bsd.port.mk>
