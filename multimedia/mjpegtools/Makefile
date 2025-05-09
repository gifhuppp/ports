COMMENT=		tools to edit/modify/encode video streams

DISTNAME=		mjpegtools-2.0.0
REVISION=		15
CATEGORIES=		multimedia
SITES=			${SITE_SOURCEFORGE:=mjpeg/}

SHARED_LIBS=		lavfile		5.0 \
			lavjpeg		5.0 \
			lavplay		5.0 \
			mjpegutils	5.0 \
			mpeg2encpp	6.0 \
			mplex2		6.0

HOMEPAGE=		https://mjpeg.sourceforge.net/

# GPLv2+
PERMIT_PACKAGE=	Yes

WANTLIB += SDL SDL_gfx X11 Xcomposite Xcursor Xdamage Xext Xfixes
WANTLIB += Xi Xinerama Xrandr Xrender atk-1.0 c cairo dv expat
WANTLIB += ffi fontconfig freetype gdk-x11-2.0 gdk_pixbuf-2.0
WANTLIB += gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0 graphite2
WANTLIB += gtk-x11-2.0 harfbuzz iconv intl jpeg m pango-1.0
WANTLIB += pangocairo-1.0 pangoft2-1.0 pcre2-8 pixman-1 png pthread
WANTLIB += sndio usbhid xcb xcb-render xcb-shm z fribidi Xau Xdmcp
WANTLIB += ${COMPILER_LIBCXX} 

COMPILER =		base-clang ports-gcc base-gcc

CXXFLAGS_base-clang =	-std=c++14

LIB_DEPENDS=		devel/sdl \
			devel/sdl-gfx \
			graphics/jpeg \
			graphics/png \
			multimedia/libdv \
			x11/gtk+2

CONFIGURE_STYLE=	autoconf
AUTOCONF_VERSION=	2.68
CONFIGURE_ARGS+=	--with-x \
			--without-libquicktime \
			--without-v4l
CONFIGURE_ENV=		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib -L${X11BASE}/lib"

FLAVORS=		optimized
FLAVOR?=

.if !${FLAVOR:Moptimized}
CONFIGURE_ARGS+=	--disable-simd-accel
.endif

.include <bsd.port.mk>
