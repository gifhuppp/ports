COMMENT =	elementary OS Gtk+/GLib extension library

SHARED_LIBS +=	granite                   0.0 # 5.5.0

GH_PROJECT =	granite
GH_TAGNAME =	5.5.0
REVISION =	0

# LGPLv3+
PERMIT_PACKAGE =	Yes

WANTLIB += cairo cairo-gobject gdk-3 gdk_pixbuf-2.0 gee-0.8 gio-2.0
WANTLIB += glib-2.0 gobject-2.0 gtk-3 intl m pango-1.0

BUILD_DEPENDS =	devel/gettext,-tools \
		devel/gobject-introspection \
		lang/vala

LIB_DEPENDS =	devel/libgee \
		x11/gtk+3

RUN_DEPENDS =	x11/gtk+4,-guic

.include <bsd.port.mk>
