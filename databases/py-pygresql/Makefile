COMMENT =	PostgreSQL module for Python

MODPY_DISTV =	6.0
DISTNAME =		PyGreSQL-${MODPY_DISTV}
PKGNAME =		py-pygresql-${MODPY_DISTV}
CATEGORIES =		databases
REVISION =		2

HOMEPAGE =		http://www.pygresql.org/

MAINTAINER =		Benoit Lecocq <benoit@openbsd.org>

# BSD
PERMIT_PACKAGE =	Yes

MODULES =	lang/python
LIB_DEPENDS =	databases/postgresql
WANTLIB +=	pq>=5 ${MODPY_WANTLIB} pthread
BUILD_DEPENDS =	databases/postgresql,-server
RUN_DEPENDS =	databases/postgresql,-main

MODPY_PI =	Yes
EXTRACT_SUFX =	.tar.gz
NO_TEST =	Yes

MODPY_PYBUILD =	setuptools

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/${MODPY_PY_PREFIX}pygresql
	cd ${WRKBUILD} && tar -cf - docs tests | \
		tar -xf - -C ${PREFIX}/share/doc/${MODPY_PY_PREFIX}pygresql/

.include <bsd.port.mk>
