COMMENT =	matrix homeserver written in Go

MODGO_MODNAME =	github.com/element-hq/dendrite
MODGO_VERSION =	v0.14.1

DISTNAME =	dendrite-${MODGO_VERSION}

CATEGORIES =	net

HOMEPAGE =	https://github.com/element-hq/dendrite

# Apache 2.0
PERMIT_PACKAGE =	Yes

WANTLIB += c pthread

MODULES =		lang/go

NO_TEST =		Yes

SUBST_VARS =		SYSCONFDIR

post-build:
	mv ${MODGO_WORKSPACE}/bin/create-account \
		${MODGO_WORKSPACE}/bin/dendrite-create-account
	mv ${MODGO_WORKSPACE}/bin/generate-config \
		${MODGO_WORKSPACE}/bin/dendrite-generate-config
	mv ${MODGO_WORKSPACE}/bin/generate-keys \
		${MODGO_WORKSPACE}/bin/dendrite-generate-keys

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/dendrite/
	${INSTALL_DATA} ${WRKSRC}/dendrite-sample.yaml \
		${PREFIX}/share/dendrite/dendrite.yaml

.include "modules.inc"

.include <bsd.port.mk>
