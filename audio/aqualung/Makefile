COMMENT=	advanced music player

VERSION=	2.0
DISTNAME=	aqualung-${VERSION}
EPOCH=		0
CATEGORIES=	audio

HOMEPAGE=	https://github.com/jeremyevans/aqualung

MAINTAINER=	Jeremy Evans <jeremy@openbsd.org>

# GPLv2
PERMIT_PACKAGE=	Yes

WANTLIB += X11 Xcomposite Xcursor Xdamage Xext Xfixes Xi Xinerama
WANTLIB += Xrandr Xrender atk-1.0 bz2 c cairo fontconfig
WANTLIB += freetype gio-2.0 glib-2.0 gobject-2.0 gthread-2.0
WANTLIB += harfbuzz iconv intl m mp3lame ogg pango-1.0 pangocairo-1.0
WANTLIB += pangoft2-1.0 pthread samplerate sndfile sndio ${COMPILER_LIBCXX}
WANTLIB += vorbis vorbisenc vorbisfile z cairo-gobject gdk-3 gtk-3
WANTLIB += gdk_pixbuf-2.0 xml2 MAC mad mpcdec FLAC avcodec
WANTLIB += avformat avutil wavpack lrdf oggz speex cddb
WANTLIB += modplug ${MODLUA_WANTLIB}

SITES=	https://github.com/jeremyevans/aqualung/releases/download/${VERSION}/

COMPILER =		base-clang ports-gcc base-gcc

MODULES=	lang/lua

MODLUA_SA=	Yes

LIB_DEPENDS=	audio/flac \
		audio/lame \
		audio/libcddb \
		audio/libmad \
		audio/libmodplug \
		audio/libsamplerate \
		audio/libsndfile \
		audio/libvorbis \
		audio/mac \
		audio/musepack \
		audio/speex \
		audio/wavpack \
		graphics/ffmpeg \
		multimedia/oggz \
		textproc/liblrdf \
		textproc/libxml \
		x11/gtk+3 \
		${MODLUA_LIB_DEPENDS}

RUN_DEPENDS=	devel/desktop-file-utils
DEBUG_PACKAGES=${BUILD_PACKAGES}

CFLAGS+=	-DPTHREAD_MIN_PRIORITY=0 -DPTHREAD_MAX_PRIORITY=31 \
		-I${LOCALBASE}/include -I${MODLUA_INCL_DIR}

BUILD_DEPENDS=	devel/gettext,-tools
AUTOCONF_VERSION=2.71
AUTOMAKE_VERSION=1.16
CONFIGURE_STYLE= gnu autoreconf
CONFIGURE_ENV=	LDFLAGS="-L${LOCALBASE}/lib -L${X11BASE}/lib " \
		lua_CFLAGS="`pkg-config --cflags ${MODLUA_DEP}`" \
		lua_LIBS="`pkg-config --libs ${MODLUA_DEP}`"

# ifp (requires libifp) - no package
CONFIGURE_ARGS=	--with-cddb \
		--with-flac \
		--with-ladspa \
		--with-lame \
		--with-lavc \
		--with-lua \
		--with-MAC \
		--with-mod \
		--with-mpc \
		--with-mpeg \
		--with-sndfile \
		--with-sndio \
		--with-speex \
		--with-src \
		--with-vorbis \
		--with-vorbisenc \
		--with-wavpack \
		--without-alsa \
		--without-cdda \
		--without-ifp \
		--without-jack \
		--without-oss \
		--without-pulse \
		--without-winmm

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/applications
	@${SUBST_CMD} -m 0644 -c ${FILESDIR}/aqualung.desktop \
		${PREFIX}/share/applications/aqualung.desktop
	@chown ${SHAREOWN}:${SHAREGRP} ${PREFIX}/share/applications/aqualung.desktop

.include <bsd.port.mk>
