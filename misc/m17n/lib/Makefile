COMMENT =	multilingual text processing library

DISTNAME =	m17n-lib-${M17N_V}
REVISION =	4

SHARED_LIBS +=  m17n-core            0.0      # 4.2
SHARED_LIBS +=  m17n                 0.0      # 4.2
SHARED_LIBS +=  m17n-flt             0.0      # 4.2
SHARED_LIBS +=  m17n-gui             0.0      # 4.2

CATEGORIES =	misc

WANTLIB += ${COMPILER_LIBCXX}
WANTLIB += ICE SM X11 Xau Xaw Xdmcp Xext Xft Xmu Xpm Xrender Xt anthy
WANTLIB += anthydic c expat fontconfig freetype fribidi gd iconv intl
WANTLIB += jpeg lzma m otf png pthread tiff webp xcb xml2 z zstd
WANTLIB += Lerc sharpyuv

LIB_DEPENDS =	devel/gettext,-runtime \
		devel/libotf \
		devel/fribidi \
		graphics/gd \
		inputmethods/anthy \
		textproc/libxml

BUILD_DEPENDS =	devel/gettext,-tools \
		textproc/ispell \
		misc/m17n/db=${M17N_V}

RUN_DEPENDS =	misc/m17n/db=${M17N_V}

CONFIGURE_ENV =	CPPFLAGS="-I${X11BASE}/include -I${LOCALBASE}/include" \
		LDFLAGS="-L${X11BASE}/lib -L${LOCALBASE}/lib ${LDFLAGS}"
LIBTOOL_FLAGS =	--tag=disable-static
SEPARATE_BUILD = Yes

.include <bsd.port.mk>
