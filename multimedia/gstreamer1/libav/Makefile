COMMENT=		ffmpeg elements for GStreamer

DISTNAME=		gst-libav-${V}

WANTLIB += avcodec avfilter avformat avutil glib-2.0 gobject-2.0
WANTLIB += gstaudio-1.0 gstbase-1.0 gstpbutils-1.0 gstreamer-1.0
WANTLIB += gstvideo-1.0

SITES=			${SITE_GST:=gst-libav/}

LIB_DEPENDS=		multimedia/gstreamer1/plugins-base=${V} \
			graphics/ffmpeg

DEBUG_PACKAGES=		${BUILD_PACKAGES}

.include <bsd.port.mk>
