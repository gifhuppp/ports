COMMENT =		control aucat and/or sndiod volume
DISTNAME =		aucatctl-0.1
CATEGORIES =		audio
HOMEPAGE =		http://www.sndio.org/
REVISION =		0

# BSD
PERMIT_PACKAGE =	Yes

WANTLIB =		c sndio
SITES =			${HOMEPAGE}
NO_TEST =		Yes
MAKE_FLAGS =		CC="${CC}"

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/aucatctl ${PREFIX}/bin/
	${INSTALL_MAN} ${WRKSRC}/aucatctl.1 ${PREFIX}/man/man1/

.include <bsd.port.mk>
