COMMENT =	japanese libkkc engine for ibus

VERSION =	20220105
DISTNAME =	ibus-kkc
PKGNAME =	ibus-kkc-${VERSION}
REVISION =	2

GH_ACCOUNT =	ueno
GH_PROJECT =	ibus-kkc
GH_COMMIT =	80f21121b908f1eb88243cc61c3c4cec2a425936

CATEGORIES =	inputmethods japanese

HOMEPAGE =	https://github.com/ueno/ibus-kkc/

# GPLv2
PERMIT_PACKAGE =	Yes

WANTLIB =	${COMPILER_LIBCXX} X11 Xau Xcomposite Xcursor Xdamage Xdmcp \
		Xext Xfixes Xi Xinerama Xrandr Xrender c epoxy expat execinfo \
		fontconfig freetype jpeg m pixman-1 xcb xcb-render xcb-shm z \
		atk-1.0 atk-bridge-2.0 cairo cairo-gobject ffi fribidi \
		gdk-3 gdk_pixbuf-2.0 gee-0.8 gio-2.0 glib-2.0 gmodule-2.0 \
		gobject-2.0 graphite2 gtk-3 harfbuzz ibus-1.0 iconv \
		intl json-glib-1.0 kkc marisa pango-1.0 pangocairo-1.0 \
		pangoft2-1.0 pcre2-8 png
WANTLIB += atspi dbus-1 epoll-shim wayland-client wayland-cursor
WANTLIB += wayland-egl xkbcommon

BUILD_DEPENDS =		devel/gettext,-tools \
			lang/vala

LIB_DEPENDS =		devel/json-glib \
			devel/libffi \
			devel/libgee \
			devel/glib2 \
			graphics/cairo \
			graphics/graphite2 \
			inputmethods/ibus \
			inputmethods/libkkc \
			textproc/libmarisa \
			x11/gnome/at-spi2-core \
			x11/gtk+3

USE_GMAKE =		Yes

CONFIGURE_STYLE =	autoreconf
AUTOCONF_VERSION =	2.69
AUTOMAKE_VERSION =	1.15

NO_TEST =		Yes

.include <bsd.port.mk>
