COMMENT=		plugins for Gedit

GNOME_PROJECT=		gedit-plugins
GNOME_VERSION=		48.1
REVISION=		0

WANTLIB += gedit-gtksourceview-300 gedit-tepl-6 gio-2.0 glib-2.0
WANTLIB += gobject-2.0 gtk-3 peas-1.0 peas-gtk-1.0

MODULES=		devel/dconf \
			devel/meson \
			lang/python \
			x11/gnome

MODGNOME_TOOLS=		yelp

BUILD_DEPENDS=		devel/appstream-glib \
			devel/gsettings-desktop-schemas \
			devel/libgit2/libgit2-glib>=0.0.6p0 \
			devel/vte3 \
			x11/dbus-python \
			x11/gedit/gedit \
			x11/gnome/gucharmap

LIB_DEPENDS=		devel/libpeas \
			x11/gedit/tepl

RUN_DEPENDS=		devel/gsettings-desktop-schemas \
			devel/libgit2/libgit2-glib>=0.0.6p0 \
			devel/py-gobject3 \
			devel/vte3 \
			x11/dbus-python \
			x11/gedit/gedit \
			x11/gnome/gucharmap

.include <bsd.port.mk>
