COMMENT =	official Go language server developed by the Go team

MODGO_MODNAME =	golang.org/x/tools/gopls
MODGO_VERSION =	v0.20.0

DISTNAME =	gopls-${MODGO_VERSION}

CATEGORIES =	devel

# https://github.com/golang/tools/tree/master/gopls
HOMEPAGE =	https://pkg.go.dev/golang.org/x/tools/gopls

MAINTAINER =	Laurent Cheylus <foxy@free.fr>

# BSD
PERMIT_PACKAGE =	Yes

WANTLIB +=	c pthread

MODULES =	lang/go

MODGO_LDFLAGS +=	-X main.version=${MODGO_VERSION}

DOCDIR =	${PREFIX}/share/doc/gopls

post-install:
	${INSTALL_DATA_DIR} ${DOCDIR}/design \
		${DOCDIR}/editor \
		${DOCDIR}/features
	${INSTALL_DATA} ${WRKSRC}/doc/*.md ${DOCDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/design/*.md ${DOCDIR}/design
	${INSTALL_DATA} ${WRKSRC}/doc/editor/*.md ${DOCDIR}/editor
	${INSTALL_DATA} ${WRKSRC}/doc/features/*.md ${DOCDIR}/features

do-test:
	cd ${WRKSRC} && ${MODGO_TEST_CMD} ./...

.include "modules.inc"

.include <bsd.port.mk>
