COMMENT =	japanese-english dictionary program

DISTNAME =	gwaei-3.2.0
REVISION =	27

SHARED_LIBS =	waei	0.0

CATEGORIES =	japanese

HOMEPAGE =	https://sourceforge.net/projects/gwaei/

# GPLv3
PERMIT_PACKAGE =	Yes

WANTLIB += ${COMPILER_LIBCXX}
WANTLIB += X11 Xcomposite Xcursor Xdamage Xext Xfixes Xi Xinerama
WANTLIB += Xrandr Xrender atk-1.0 atk-bridge-2.0 c cairo cairo-gobject
WANTLIB += crypto curl epoxy expat ffi fontconfig freetype fribidi
WANTLIB += gdk-3 gdk_pixbuf-2.0 gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0
WANTLIB += graphite2 gthread-2.0 gtk-3 harfbuzz iconv intl m nghttp2
WANTLIB += pango-1.0 pangocairo-1.0 pangoft2-1.0 pcre2-8 pixman-1
WANTLIB += png pthread ssl xcb xcb-render xcb-shm z Xau Xdmcp
WANTLIB += execinfo jpeg atspi dbus-1 epoll-shim nghttp3 ngtcp2
WANTLIB += ngtcp2_crypto_quictls wayland-client wayland-cursor
WANTLIB += wayland-egl xkbcommon

SITES =		${SITE_SOURCEFORGE:=gwaei/}

MODULES =	devel/dconf \
		textproc/intltool \
		x11/gnome

USE_GMAKE =	Yes

RUN_DEPENDS =	fonts/ja-kanjistrokeorders-ttf \
		textproc/docbook
LIB_DEPENDS =	devel/gettext,-runtime \
		net/curl \
		x11/gtk+3

CONFIGURE_STYLE = gnu
CONFIGURE_ARGS =	ENCHANT="${LOCALBASE}/bin/enchant" \
			--disable-scrollkeeper

MODGNOME_TOOLS =	desktop-file-utils gtk-update-icon-cache

pre-configure:
	${SUBST_CMD} ${WRKSRC}/src/gwaei/help/C/*.{in,xml}

.include <bsd.port.mk>
