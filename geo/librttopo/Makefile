COMMENT =	RT Topology Library
DISTNAME =	librttopo-1.1.0
REVISION =	1
CATEGORIES =	geo

SHARED_LIBS +=	rttopo 0.0 #2.0

HOMEPAGE =	https://git.osgeo.org/gogs/rttopo/librttopo

# GPLv2
PERMIT_PACKAGE=	Yes

SITES =		http://download.osgeo.org/librttopo/src/

CONFIGURE_STYLE=gnu
LIB_DEPENDS =	geo/geos
WANTLIB += geos geos_c m ${COMPILER_LIBCXX} pthread

# upstream checks for geos-config --includes but fails to use it..
MAKE_FLAGS =	CFLAGS=-I${LOCALBASE}/include

.include <bsd.port.mk>
