COMMENT=	shapefile manipulation library

V =		1.6.1
DISTNAME=	shapelib-${V}

CATEGORIES=	devel

HOMEPAGE=	http://shapelib.maptools.org/

SHARED_LIBS +=  shp                       3.1 # 4.0

# LGPL
PERMIT_PACKAGE=	Yes

# C++
COMPILER=	base-clang ports-gcc

WANTLIB += ${COMPILER_LIBCXX} c m

SITES=		https://download.osgeo.org/shapelib/

MODULES =	devel/cmake
BUILD_DEPENDS =	devel/gtest

.include <bsd.port.mk>
