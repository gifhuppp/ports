COMMENT=	Unico GTK+3 engine

V=		1.0.2.1
DISTNAME=	unico-${V}
PKGNAME=	gtk3-unico-engine-${V}
REVISION=	9

CATEGORIES=	x11

HOMEPAGE=	https://launchpad.net/unico/

# LGPLv3
PERMIT_PACKAGE=	Yes

WANTLIB += X11 Xcomposite Xcursor Xdamage Xext Xfixes Xi Xinerama
WANTLIB += Xrandr Xrender atk-1.0 atk-bridge-2.0 atspi cairo
WANTLIB += cairo-gobject dbus-1 epoxy expat ffi fontconfig freetype
WANTLIB += fribidi gdk-3 gdk_pixbuf-2.0 gio-2.0 glib-2.0 gmodule-2.0
WANTLIB += gobject-2.0 graphite2 gtk-3 harfbuzz iconv intl m
WANTLIB += pango-1.0 pangocairo-1.0 pangoft2-1.0 pcre2-8 pixman-1 png
WANTLIB += pthread xcb xcb-render xcb-shm z harfbuzz
WANTLIB += Xau Xdmcp c++ c++abi epoll-shim jpeg wayland-client
WANTLIB += wayland-cursor wayland-egl xkbcommon

SITES=		https://distfiles.sigtrap.nl/

LIB_DEPENDS=	x11/gtk+3

CONFIGURE_STYLE=gnu

post-install:
	rm ${PREFIX}/lib/gtk-3.0/3.0.0/theming-engines/*.{a,la}

.include <bsd.port.mk>
