COMMENT=		WebP GDK Pixbuf Loader library

GH_ACCOUNT=		aruiz
GH_PROJECT=		webp-pixbuf-loader
GH_TAGNAME=		0.2.7

CATEGORIES=		graphics

MAINTAINER=		Antoine Jacoutot <ajacoutot@openbsd.org>

# LGPLv2
PERMIT_PACKAGE=		Yes

WANTLIB += gdk_pixbuf-2.0 glib-2.0 gobject-2.0 webp webpdemux webpmux

MODULES=		devel/meson

LIB_DEPENDS=		graphics/gdk-pixbuf2 \
			graphics/libwebp

DEBUG_PACKAGES=		${BUILD_PACKAGES}

.include <bsd.port.mk>
