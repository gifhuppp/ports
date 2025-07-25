COMMENT =		lightweight mapping application for use with or without GPS

DISTNAME =		foxtrotgps-1.2.2
REVISION =		7

CATEGORIES =		geo x11

HOMEPAGE =		https://www.foxtrotgps.org/

SITES =			${HOMEPAGE}/releases/

MAINTAINER =		Kirill Bychkov <kirby@openbsd.org>

# GPLv2
PERMIT_PACKAGE =	Yes

WANTLIB += X11 Xcomposite Xcursor Xdamage Xext Xfixes Xi Xinerama Xrandr
WANTLIB += Xrender atk-1.0 c cairo crypto curl dbus-1 exif expat ffi fontconfig
WANTLIB += freetype fribidi gdk-x11-2.0 gdk_pixbuf-2.0 gio-2.0 glade-2.0
WANTLIB += glib-2.0 gmodule-2.0 gobject-2.0 gps graphite2 gthread-2.0
WANTLIB += gtk-x11-2.0 harfbuzz iconv intl lzma m nghttp2 pango-1.0
WANTLIB += pangocairo-1.0 pangoft2-1.0 pcre2-8 pixman-1 png pthread sqlite3
WANTLIB += ssl xcb xcb-render xcb-shm xml2 z ${COMPILER_LIBCXX}
WANTLIB += Xau Xdmcp execinfo jpeg
WANTLIB += nghttp3 ngtcp2 ngtcp2_crypto_quictls

MODULES = 		devel/dconf \
			lang/python \
			textproc/intltool

BUILD_DEPENDS = 	devel/gettext,-tools \
			devel/gsettings-desktop-schemas
LIB_DEPENDS =		devel/libglade2 \
			databases/sqlite3 \
			graphics/libexif \
			misc/gpsd \
			net/curl \
			x11/gtk+2

RUN_DEPENDS = 		devel/desktop-file-utils \
			devel/gsettings-desktop-schemas

CONFIGURE_ENV += 	CPPFLAGS=-I${LOCALBASE}/include \
			LDFLAGS="-L${LOCALBASE}/lib -liconv -lintl"

SEPARATE_BUILD = 	Yes
USE_GMAKE = 		Yes
CONFIGURE_STYLE =	gnu
NO_TEST = 		Yes

MODPY_ADJ_FILES = 	contrib/georss2foxtrotgps-poi
MODPY_RUNDEP = 		No

.include <bsd.port.mk>
