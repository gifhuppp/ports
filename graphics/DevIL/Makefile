COMMENT=		library for powerful image loading capabilities

DISTNAME=		DevIL-1.7.8
REVISION=		23

SHARED_LIBS+=		IL	1.0 # 2.0
SHARED_LIBS+=		ILU	1.0 # 2.0
SHARED_LIBS+=		ILUT	1.0 # 2.0

CATEGORIES=		graphics devel

HOMEPAGE=		https://openil.sourceforge.net/

# LGPLv2.1
PERMIT_PACKAGE=	Yes

SITES=			${SITE_SOURCEFORGE:=openil/}
EXTRACT_SUFX=		.zip

WANTLIB += ${COMPILER_LIBCXX} GL GLU ICE Xau Xdmcp lzma xcb-shm zstd
WANTLIB += Iex-3_3 OpenEXR-3_3 OpenEXRCore-3_3 OpenEXRUtil-3_3
WANTLIB += IlmThread-3_3 Imath-3_1 SDL SM X11 X11-xcb xcb-randr
WANTLIB += Xext Xfixes Xi Xmu Xrandr Xrender Xt Xxf86vm deflate
WANTLIB += c drm expat glapi glut iconv jasper jpeg lcms m mng
WANTLIB += png sndio tiff usbhid xcb xcb-dri2 xcb-dri3 xcb-glx
WANTLIB += xcb-present xcb-sync xcb-xfixes xshmfence z
WANTLIB += LLVM Lerc drm_amdgpu elf pciaccess

COMPILER =		base-clang ports-gcc base-gcc

LIB_DEPENDS=		converters/libiconv \
			devel/sdl \
			graphics/freeglut \
			graphics/jasper \
			graphics/libmng \
			graphics/lcms \
			graphics/openexr \
			graphics/tiff \
			graphics/png


AUTOCONF_VERSION=	2.61
CONFIGURE_STYLE=	autoconf
CONFIGURE_ARGS+=	--with-squish=no \
			--with-zlib=yes \
			--enable-ILU \
			--enable-ILUT \
			--disable-allegro

# This would only install three binary examples, we'll install it manually.
CONFIGURE_ARGS+=	--with-examples=no
CONFIGURE_ENV=  	CPPFLAGS="-I${LOCALBASE}/include -I${X11BASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib -L${X11BASE}/lib -lm -lz"

WRKDIST=		${WRKDIR}/${DISTNAME:L}

# Too many Linuxisms in testing tools
NO_TEST=		Yes

# gcc-8's _mm_malloc() uses the AltiVec keyword __vector, so we need
# to disable it to make it run on macppc G3 machines
.if ${MACHINE_ARCH:Mpowerpc}
CONFIGURE_ENV +=	ac_cv_header_mm_malloc_h=
.endif

post-extract:
	chmod +x ${WRKSRC}/configure
	${SUBST_CMD} ${WRKSRC}/test/Makefile.in

post-configure:
	chmod +x ${WRKDIST}/build-aux/install-sh

post-install:
	@cd ${WRKSRC}; tar cf - examples | tar xf - -C \
		${PREFIX}/share/devil/

.include <bsd.port.mk>
