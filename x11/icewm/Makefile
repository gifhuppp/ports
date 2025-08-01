# unconditionally uses machine/apmvar.h and related structures/defines
ONLY_FOR_ARCHS=	${APM_ARCHS}

V=		3.8.1
COMMENT=	small and fast window manager
DISTNAME=	icewm-${V}
EXTRACT_SUFX=	.tar.lz
CATEGORIES=	x11
REVISION=	1

HOMEPAGE=	https://ice-wm.org/

# LGPLv2 only
PERMIT_PACKAGE=	Yes

WANTLIB += ${COMPILER_LIBCXX}
WANTLIB += FLAC ICE Imlib2 SM X11 X11-xcb XRes Xau Xcomposite
WANTLIB += Xdamage Xdmcp Xext Xfixes Xft Xinerama Xpm Xrandr Xrender
WANTLIB += ao c cairo expat ffi fontconfig freetype fribidi gdk_pixbuf-2.0
WANTLIB += gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0 graphite2
WANTLIB += harfbuzz iconv intl jpeg lzma m mp3lame mpg123 ogg
WANTLIB += opus pango-1.0 pangocairo-1.0 pangoft2-1.0 pcre2-8
WANTLIB += pixman-1 png rsvg-2 sndfile vorbis vorbisenc xcb xcb-render
WANTLIB += xcb-shm xml2 z

COMPILER=	base-clang ports-gcc base-gcc

SITES=		https://github.com/ice-wm/icewm/releases/download/${V}/

BUILD_DEPENDS=	devel/gettext,-tools \
		textproc/asciidoc

LIB_DEPENDS=	audio/libao \
		audio/libsndfile \
		devel/fribidi \
		devel/glib2 \
		devel/harfbuzz \
		devel/pango \
		graphics/cairo \
		graphics/gdk-pixbuf2 \
		graphics/imlib2 \
		textproc/libxml,-main \
		x11/gnome/librsvg

RUN_DEPENDS=	devel/desktop-file-utils

CONFIGURE_STYLE=gnu
CONFIGURE_ARGS=	--with-libdir=${PREFIX}/share/icewm \
		--with-cfgdir=${SYSCONFDIR}/icewm \
		--with-x \
		--enable-corefonts \
		--enable-i18n

# XXX TODO
#CONFIGURE_ARGS+=--with-icesound=sndio

CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

TEST_ENV=	FAKED_MODE=True

# make: don't know how to make %.html: (prerequisite of: icewm.html)
USE_GMAKE=	Yes

pre-configure:
	${SUBST_CMD} ${WRKSRC}/doc/icewm.adoc

.include <bsd.port.mk>
