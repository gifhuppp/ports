COMMENT=		Actions, Menus and Toolbars Kit

DIST_TUPLE=		gnome World/gedit libgedit-amtk 5.9.1 .

SHARED_LIBS += gedit-amtk-5              0.0 # 0

CATEGORIES=		devel

WANTLIB += gio-2.0 glib-2.0 gobject-2.0 gtk-3 intl

MODULES=		devel/meson \
			x11/gnome

MODGNOME_TOOLS= 	gobject-introspection

BUILD_DEPENDS=		devel/gettext,-tools \
			textproc/gtk-doc

LIB_DEPENDS=		x11/gtk+3

.include <bsd.port.mk>
