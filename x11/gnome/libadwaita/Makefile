COMMENT=		building blocks for modern adaptive GNOME apps

GNOME_PROJECT=		libadwaita
GNOME_VERSION=		1.7.6
EPOCH=			0

SHARED_LIBS += adwaita-1                 1.9 # 0

# LGPLv2.1+
PERMIT_PACKAGE=		Yes

WANTLIB += appstream c fribidi gio-2.0 glib-2.0 gobject-2.0 graphene-1.0
WANTLIB += gtk-4 intl m pango-1.0

COMPILER=		base-clang ports-gcc
COMPILER_LANGS=		c

MODULES=		devel/meson \
			x11/gnome

MODGNOME_TOOLS=		desktop-file-utils gobject-introspection vala \
			gtk-update-icon-cache

BUILD_DEPENDS=		www/sassc

LIB_DEPENDS=		devel/appstream \
			x11/gtk+4

DEBUG_PACKAGES=		${BUILD_PACKAGES}

TEST_IS_INTERACTIVE=	x11

.include <bsd.port.mk>
