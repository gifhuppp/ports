COMMENT =	manipulation and analysis of planar geometric objects

MODPY_DISTV =	2.1.1
GH_TAGNAME =	${MODPY_DISTV}
GH_ACCOUNT =	shapely
GH_PROJECT =	shapely
PKGNAME =	py-shapely-${MODPY_DISTV:S/.post/pl/}

CATEGORIES =	geo

HOMEPAGE =	https://github.com/shapely/shapely

# BSD
PERMIT_PACKAGE =	Yes

MODULES =	lang/python
MODPY_PYBUILD =	setuptools
MODPY_TEST_LINK_SO =	Yes

RUN_DEPENDS +=	math/py-numpy
# cython and numpy needed to build _vectorized.so
BUILD_DEPENDS +=${RUN_DEPENDS} \
		lang/cython

LIB_DEPENDS =	geo/geos
WANTLIB =	geos_c

.include <bsd.port.mk>
