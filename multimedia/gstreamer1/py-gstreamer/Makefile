COMMENT=		overrides for the gobject-introspection-based pygst bindings

DISTNAME=		gst-python-${V}
PKGNAME=		py-gstreamer1-${V}

HOMEPAGE=		http://gstreamer.freedesktop.org/modules/gst-python.html

WANTLIB += ${MODPY_WANTLIB}
WANTLIB += glib-2.0 gobject-2.0 gstreamer-1.0

SITES=			${SITE_GST:=gst-python/}

# XXX we need the meson MODULE to come first, but Makefile.inc is parsed after
MODULES=		devel/meson lang/python

# MODPY_LIBDIR/gi/overrides/
BUILD_DEPENDS=		devel/py-gobject3 \
			multimedia/gstreamer1/plugins-base>=${V}
RUN_DEPENDS=		devel/py-gobject3 \
			multimedia/gstreamer1/plugins-base>=${V}

LIB_DEPENDS=		multimedia/gstreamer1/core>=${V} \
			${MODPY_LIB_DEPENDS}

CONFIGURE_ARGS=		-Dlibpython-dir=${LOCALBASE}/lib

DEBUG_PACKAGES=		${BUILD_PACKAGES}

.include <bsd.port.mk>
