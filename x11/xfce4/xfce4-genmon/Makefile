COMMENT=	Xfce4 generic scriptable monitor panel plugin

XFCE_VERSION=	4.2.1
XFCE_PLUGIN=	genmon

# LGPLv2
PERMIT_PACKAGE=	Yes

MODULES=	x11/xfce4

WANTLIB += ICE SM X11 X11-xcb Xcomposite Xcursor Xdamage Xext Xfixes Xi
WANTLIB += Xinerama Xrandr Xrender atk-1.0 atk-bridge-2.0
WANTLIB += cairo cairo-gobject epoxy expat ffi fontconfig
WANTLIB += freetype fribidi gdk-3 gdk_pixbuf-2.0 gio-2.0 glib-2.0
WANTLIB += gmodule-2.0 gobject-2.0 graphite2 gtk-3 harfbuzz
WANTLIB += iconv intl m pango-1.0 pangocairo-1.0 pangoft2-1.0 pcre2-8
WANTLIB += pixman-1 png pthread startup-notification-1 xcb xcb-render
WANTLIB += xcb-shm xcb-util xfce4ui-2 xfce4util z
WANTLIB += epoll-shim gtk-layer-shell wayland-client wayland-cursor
WANTLIB += wayland-egl xkbcommon ${COMPILER_LIBCXX}
WANTLIB += Xau Xdmcp jpeg atspi dbus-1 gthread-2.0 xfconf-0

.include <bsd.port.mk>
