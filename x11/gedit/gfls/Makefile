COMMENT=		file loading and saving module

DIST_TUPLE=		gnome World/gedit libgedit-gfls 0.3.0 .

SHARED_LIBS += gedit-gfls-1              0.2 # 0

CATEGORIES=		devel

WANTLIB += gio-2.0 glib-2.0 gobject-2.0

MODULES=		devel/meson \
			x11/gnome

MODGNOME_TOOLS= 	gobject-introspection

BUILD_DEPENDS=		textproc/gtk-doc

# needed to build tests
BUILD_DEPENDS +=	x11/gtk+3

LIB_DEPENDS=		devel/glib2

.include <bsd.port.mk>
