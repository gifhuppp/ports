# devel/tbb does not support 64-bits atomics on ppc32, forcing them does
# not help, see tbb's ${WRKSRC}/include/tbb/machine/mac_ppc.h
NOT_FOR_ARCHS =	powerpc

COMMENT=	tools for storage and manipulation of volumetric data

GH_ACCOUNT=	AcademySoftwareFoundation
GH_PROJECT=	openvdb
GH_TAGNAME=	v11.0.0
REVISION=	0

SHARED_LIBS +=  openvdb                   5.0 # 9.0

CATEGORIES=	graphics

HOMEPAGE=	https://www.openvdb.org/

# MPL
PERMIT_PACKAGE=	Yes

WANTLIB += ${COMPILER_LIBCXX} blosc boost_iostreams-mt boost_regex-mt
WANTLIB += c m tbb tbbmalloc z

COMPILER=	base-clang ports-gcc

MODULES=	devel/cmake

LIB_DEPENDS=	archivers/blosc \
		devel/boost \
		devel/tbb

NO_TEST=	Yes

.include <bsd.port.mk>
