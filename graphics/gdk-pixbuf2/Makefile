COMMENT=		image data transformation library

GNOME_PROJECT=		gdk-pixbuf
GNOME_VERSION=		2.42.12
REVISION=		0

CATEGORIES=		graphics

SHARED_LIBS += gdk_pixbuf-2.0            3200.3 # 0.4200.12

HOMEPAGE=		http://www.gtk.org/

MAINTAINER=		Antoine Jacoutot <ajacoutot@openbsd.org>

# LGPLv2.1
PERMIT_PACKAGE=	Yes

WANTLIB += c gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0 intl jpeg
WANTLIB += m png tiff

MODULES=		devel/meson \
			x11/gnome

BUILD_DEPENDS=		textproc/py-docutils

LIB_DEPENDS=		devel/glib2 \
			graphics/png \
			graphics/tiff

# configure: detect and set GDK_PIXBUF_USE_GIO_MIME
# (g_content_type_from_mime_type requires shared-mime-info)
BUILD_DEPENDS +=	misc/shared-mime-info
RUN_DEPENDS +=		misc/shared-mime-info

MODGNOME_TOOLS=		docbook gobject-introspection shared-mime-info

CONFIGURE_ARGS=		-Dinstalled_tests=false

# XXX
# bmp needed by games/eduke32 at build time
# bmp needed by games/nblood at build time
# ico needed by games/openclonk at build time
# xpm needed by sysutils/gkrellm/gkrellm at run time
# xpm needed by www/netsurf/browser at build time
# xpm needed by www/netsurf/netsurf-fb at build time
# (non exhaustive list)
CONFIGURE_ARGS +=	-Dothers=enabled

DEBUG_PACKAGES=		${BUILD_PACKAGES}

TEST_DEPENDS=		${BASE_PKGPATH}=${GNOME_VERSION}

.include <bsd.port.mk>
