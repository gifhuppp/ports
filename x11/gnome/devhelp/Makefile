# build time requirement for WebKit2-4.0 introspection
USE_WXNEEDED=		Yes

COMMENT=		API documentation browser for GNOME

GNOME_PROJECT=		devhelp
GNOME_VERSION=		43.0
REVISION=		2

SHARED_LIBS += devhelp-3                 1.0 # 6.3.0

CATEGORIES=		textproc

HOMEPAGE=		https://apps.gnome.org/en/Devhelp/

# GPLv2
PERMIT_PACKAGE=		Yes

WANTLIB += c gdk-3 gio-2.0 glib-2.0 gobject-2.0 gtk-3 intl pango-1.0
WANTLIB += webkit2gtk-4.1

MODULES=		devel/dconf \
			devel/meson \
			x11/gnome

MODGNOME_LDFLAGS=	-L${X11BASE}/lib

MODGNOME_TOOLS=		desktop-file-utils gobject-introspection \
			gtk-update-icon-cache yelp

LIB_DEPENDS=		www/webkitgtk4,webkitgtk41

# for convenience
RUN_DEPENDS +=		x11/gnome/devel-docs

DEBUG_PACKAGES=		${BUILD_PACKAGES}

.include <bsd.port.mk>
