COMMENT =	configuration editor for openbox window manager

VERSION =	0.16.5
REVISION =	0

NAME =		obconf-qt

WANTLIB += ${COMPILER_LIBCXX} GL ICE Imlib2 Qt6Core Qt6Gui Qt6Widgets
WANTLIB += SM X11 Xft c cairo fontconfig freetype
WANTLIB += gdk_pixbuf-2.0 gio-2.0 glib-2.0 gobject-2.0 harfbuzz
WANTLIB += intl m obrender obt pango-1.0 pangoft2-1.0 pangoxft-1.0
WANTLIB += rsvg-2 xml2

MODULES +=	x11/qt6 devel/cmake

LIB_DEPENDS =	devel/harfbuzz \
		devel/pango \
		graphics/cairo \
		graphics/gdk-pixbuf2 \
		graphics/imlib2 \
		textproc/libxml \
		x11/gnome/librsvg \
		x11/openbox

RUN_DEPENDS =	devel/desktop-file-utils \
		x11/gtk+4,-guic

.include <bsd.port.mk>
