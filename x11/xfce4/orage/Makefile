COMMENT=	Xfce4 calendar

XFCE_GOODIE=	orage
XFCE_VERSION=	4.20.1

# GPLv2
PERMIT_PACKAGE=	Yes

MODULES=	x11/xfce4
MODXFCE_DESKTOP_FILE=	Yes
MODXFCE_ICON_CACHE=	Yes
RUN_DEPENDS=	misc/shared-mime-info

LIB_DEPENDS =	x11/xfce4/libxfce4ui \
		textproc/libical \
		devel/libnotify

WANTLIB += ${COMPILER_LIBCXX} ICE SM X11 X11-xcb Xau Xcomposite
WANTLIB += Xcursor Xdamage Xdmcp Xext Xfixes Xi Xinerama Xrandr
WANTLIB += Xrender atk-1.0 atk-bridge-2.0 atspi c cairo cairo-gobject
WANTLIB += dbus-1 epoxy expat ffi fontconfig
WANTLIB += freetype fribidi gdk-3 gdk_pixbuf-2.0 gio-2.0 glib-2.0
WANTLIB += gmodule-2.0 gobject-2.0 graphite2 gtk-3 harfbuzz iconv
WANTLIB += intl jpeg m notify pango-1.0 pangocairo-1.0 pangoft2-1.0
WANTLIB += pcre2-8 pixman-1 png startup-notification-1 xcb xcb-render
WANTLIB += xcb-shm xcb-util xfce4ui-2 xfce4util
WANTLIB += db db_cxx ical icalss icalvcal icudata icui18n icuuc z
WANTLIB += epoll-shim gthread-2.0 wayland-client wayland-cursor
WANTLIB += wayland-egl xfconf-0 xkbcommon

.include <bsd.port.mk>
