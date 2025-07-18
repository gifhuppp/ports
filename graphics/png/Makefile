COMMENT=	library for manipulating PNG images

VERSION=	1.6.49
REVISION=	0
DISTNAME=	libpng-${VERSION}
PKGNAME=	png-${VERSION}
CATEGORIES=	graphics
DPB_PROPERTIES=	parallel
SITES=		${SITE_SOURCEFORGE:=libpng/}
EXTRACT_SUFX=	.tar.xz

SHARED_LIBS=	png	18.2 \
		png16	18.2

HOMEPAGE=	http://www.libpng.org/pub/png/libpng.html

# BSD
PERMIT_PACKAGE=	Yes

WANTLIB=	c m z

SEPARATE_BUILD=	Yes
CONFIGURE_STYLE=gnu

# Enable SIMD support
.if ${MACHINE_ARCH} == "aarch64" || ${MACHINE_ARCH} == "amd64" || \
    ${MACHINE_ARCH} == "powerpc64"
CONFIGURE_ARGS+=	--enable-hardware-optimizations
.else
CONFIGURE_ARGS+=	--disable-hardware-optimizations
.endif

# Enable VSX to prevent #error "This code requires VSX..." in
# powerpc/filter_vsx_intrinsics.c
.if ${MACHINE_ARCH} == "powerpc64"
CFLAGS+=	-mvsx
.endif

DEBUG_PACKAGES =	${BUILD_PACKAGES}

post-install:
	cd ${PREFIX}/lib; \
	    ln -s libpng.so.${LIBpng16_VERSION} libpng16.so.${LIBpng_VERSION}

.include <bsd.port.mk>
