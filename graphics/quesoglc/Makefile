COMMENT=	implementation of the OpenGL Character Renderer

DISTNAME=	quesoglc-0.7.2
REVISION=	12
CATEGORIES=	graphics
SITES=		${SITE_SOURCEFORGE:=quesoglc/}

SHARED_LIBS=	GLC	0.0

HOMEPAGE=	https://quesoglc.sourceforge.net/

MAINTAINER=	Brad Smith <brad@comstyle.com>

# LGPLv2.1+
PERMIT_PACKAGE=	Yes

WANTLIB += GL GLU X11 Xext Xfixes Xxf86vm drm expat fontconfig
WANTLIB += X11-xcb glapi pthread xcb-dri2
WANTLIB += freetype fribidi m xcb xcb-glx z
WANTLIB += xcb-dri3 xcb-present xcb-sync xcb-xfixes xshmfence
WANTLIB += Xau Xdmcp xcb-shm
WANTLIB += LLVM c++ c++abi drm_amdgpu elf pciaccess
WANTLIB += xcb-randr

COMPILER=	base-clang ports-gcc base-gcc
COMPILER_LANGS=	c

LIB_DEPENDS=	devel/fribidi

CONFIGURE_STYLE= gnu
# Needs GLEW MX
CONFIGURE_ARGS+= --without-glew --disable-executables
CONFIGURE_ENV=	CPPFLAGS="-I${X11BASE}/include -I${LOCALBASE}/include" \
		LDFLAGS="-L${X11BASE}/lib -L${LOCALBASE}/lib"

NO_TEST=	Yes

.include <bsd.port.mk>
