COMMENT =	multicast router utilizing IGMP forwarding

V =		0.4
DISTNAME =	igmpproxy-${V}
REVISION =	1

CATEGORIES =	net

HOMEPAGE =	https://github.com/pali/igmpproxy/

# GPLv2+ + mrouted license in igmpproxy/COPYING
PERMIT_PACKAGE =	Yes

WANTLIB =	c

SITES =		${HOMEPAGE}/releases/download/${V}/

MAKE_FLAGS =	CFLAGS="${CFLAGS} -Wall" \
		LDFLAGS="${LDFLAGS}"

CONFIGURE_STYLE =	gnu

DEBUG_PACKAGES =	${BUILD_PACKAGES}

NO_TEST =	Yes

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/igmpproxy ${PREFIX}/sbin
	${INSTALL_MAN} ${WRKSRC}/doc/igmpproxy.8 ${PREFIX}/man/man8
	${INSTALL_MAN} ${WRKSRC}/doc/igmpproxy.conf.5 ${PREFIX}/man/man5
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/igmpproxy
	${INSTALL_DATA} ${WRKSRC}/igmpproxy.conf \
	    ${PREFIX}/share/examples/igmpproxy

.include <bsd.port.mk>
