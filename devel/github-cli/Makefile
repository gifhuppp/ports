COMMENT =	command-line access to github pull requests, issues and more

V =		2.76.1
MODGO_MODNAME =	github.com/cli/cli/v${V:R:R}
MODGO_VERSION =	v${V}

DISTNAME =	cli-${MODGO_VERSION}
PKGNAME =	github-cli-${V}

CATEGORIES =	devel
HOMEPAGE =	https://cli.github.com/

MAINTAINER =	Klemens Nanni <kn@openbsd.org>

# MIT
PERMIT_PACKAGE =	Yes

WANTLIB +=	c pthread

MODULES =	lang/go
MODGO_LDFLAGS +=	-X "${MODGO_MODNAME}/internal/build.Version=$V"

PORTHOME =	${WRKDIR}

do-test:
	cd ${WRKSRC} && ${MODGO_TEST_CMD} ./...

post-install:
	${WRKDIR}/go/bin/gen-docs --doc-path ${PREFIX}/man/man1 --man-page
	rm ${PREFIX}/bin/gen-docs

.include "modules.inc"
.include <bsd.port.mk>
