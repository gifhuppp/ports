COMMENT=	Xfce4 mailboxes monitor panel plugin

XFCE_VERSION=	1.3.2
XFCE_PLUGIN=	mailwatch

# GPLv2
PERMIT_PACKAGE=	Yes

MODULES=	x11/xfce4

MODXFCE_ICON_CACHE=	Yes

WANTLIB += ${COMPILER_LIBCXX} ICE SM X11 X11-xcb Xau Xcomposite
WANTLIB += Xcursor Xdamage Xdmcp Xext Xfixes Xi Xinerama Xrandr
WANTLIB += Xrender atk-1.0 atk-bridge-2.0 atspi
WANTLIB += cairo cairo-gobject dbus-1 epoxy exo-2 expat
WANTLIB += ffi fontconfig freetype fribidi gdk-3 gdk_pixbuf-2.0
WANTLIB += gio-2.0 glib-2.0 gmodule-2.0 gmp gnutls gobject-2.0
WANTLIB += graphite2 gthread-2.0 gtk-3 harfbuzz hogweed iconv
WANTLIB += idn2 intl jpeg m nettle p11-kit pango-1.0 pangocairo-1.0
WANTLIB += pangoft2-1.0 pcre2-8 pixman-1 png startup-notification-1
WANTLIB += tasn1 unistring xcb xcb-render xcb-shm xcb-util xfce4ui-2
WANTLIB += xfce4util xfconf-0 z
WANTLIB += epoll-shim gtk-layer-shell wayland-client wayland-cursor
WANTLIB += wayland-egl xkbcommon


LIB_DEPENDS+=	security/gnutls

.include <bsd.port.mk>
