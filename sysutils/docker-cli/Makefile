COMMENT =		command-line tool for controlling Docker

V =			26.1.3

GH_ACCOUNT =		docker
GH_PROJECT =		cli
GH_TAGNAME =		v${V}
PKGNAME =		docker-${DISTNAME}

CATEGORIES =		sysutils

HOMEPAGE =		https://docs.docker.com/engine/reference/commandline/cli/

MAINTAINER =		Kirill A. Korinsky <kirill@korins.ky>

# Apache 2.0
PERMIT_PACKAGE =	Yes

WANTLIB += 		c pthread

MODULES =		lang/go
GO_PKGNAME =		github.com/docker/cli
MODGO_LDFLAGS =		-X ${GO_PKGNAME}/cli/version.Version=${V}

RUN_DEPENDS =		sysutils/docker-buildx

WRKSRC =		${MODGO_WORKSPACE}/src/${GO_PKGNAME}
ALL_TARGET =		${GO_PKGNAME}/cmd/docker

.include <bsd.port.mk>
