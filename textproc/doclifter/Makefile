COMMENT =		troff to DocBook converter

DISTNAME =		doclifter-2.21
REVISION =		0

CATEGORIES =		textproc

HOMEPAGE =		http://www.catb.org/~esr/doclifter/

# BSD
PERMIT_PACKAGE =	Yes

SITES =			http://www.catb.org/~esr/doclifter/

MODULES =		lang/python

MODPY_ADJ_FILES =	manlifter

NO_BUILD =		Yes

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/doclifter ${WRKSRC}/manlifter \
		${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/doclifter.1 ${WRKSRC}/manlifter.1 \
		${PREFIX}/man/man1

do-test:
	cd ${WRKSRC}/tests && ${MAKE}

.include <bsd.port.mk>
