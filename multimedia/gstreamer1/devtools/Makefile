COMMENT=		GStreamer development and validation tools

DISTNAME=		gst-devtools-${V}

SHARED_LIBS += gstvalidate-1.0           0.1 # 0.2604.0
SHARED_LIBS += gstvalidate-default-overrides-1.0 0.1 # 0.2604.0

SITES=			${SITE_GST:=gst-devtools/}

WANTLIB += c cairo gdk-3 gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0
WANTLIB += gstapp-1.0 gstaudio-1.0 gstbase-1.0 gstcheck-1.0 gstcontroller-1.0
WANTLIB += gstpbutils-1.0 gstreamer-1.0 gstrtspserver-1.0 gsttranscoder-1.0
WANTLIB += gstvideo-1.0 gtk-3 json-glib-1.0 m

# XXX single-instance uses linux-only abstract sockets UnixAddr::new_abstract()
#MODULES +=		devel/cargo
#MODCARGO_CARGOTOML=	${WRKSRC}/dots-viewer/Cargo.toml
## use the main cargo FULLDISTDIR (${DISTDIR}/cargo)
#MODCARGO_DIST_SUBDIR ?= ../cargo
#pre-configure:
#	@${MODCARGO_configure}
#.include "crates.inc"
CONFIGURE_ARGS +=	-Ddots_viewer=disabled

BUILD_DEPENDS=		devel/gobject-introspection

LIB_DEPENDS=		multimedia/gstreamer1/plugins-bad=${V} \
			multimedia/gstreamer1/rtsp-server=${V} \
			x11/gtk+3

DEBUG_PACKAGES=		${BUILD_PACKAGES}

.include <bsd.port.mk>
