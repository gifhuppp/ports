COMMENT =	CLI program to download videos from YouTube and other sites

VERSION =	2021.12.17
MODPY_DISTV =	${VERSION:S/.0/./g}

DISTNAME =	youtube-dl-${VERSION}
CATEGORIES =	www
REVISION =	5

HOMEPAGE =	https://yt-dl.org

# Public Domain
PERMIT_PACKAGE =	Yes

SITES =		https://youtube-dl.org/downloads/${VERSION}/

MODULES =	lang/python

MODPY_PYBUILD =	setuptools

TEST_DEPENDS +=	devel/flake8

WRKDIST =	${WRKDIR}/youtube-dl

.include <bsd.port.mk>
