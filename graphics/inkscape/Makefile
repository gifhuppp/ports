COMMENT =	SVG vector drawing application

VERSION =	1.4.1
DISTNAME =	inkscape-${VERSION}

CATEGORIES =	graphics

HOMEPAGE =	https://www.inkscape.org/

MAINTAINER =	Rafael Sadowski <rsadowski@openbsd.org>

SHARED_LIBS +=  inkscape_base             1.0 # 0.0

# GPLv2 and LGPLv2.1
PERMIT_PACKAGE =	Yes

WANTLIB += ${COMPILER_LIBCXX} 2geom ICE Magick++-6.Q16 MagickCore-6.Q16
WANTLIB += MagickWand-6.Q16 SM X11 Xext atk-1.0 atkmm-1.6 boost_atomic-mt
WANTLIB += boost_filesystem-mt c cairo cairo-gobject cairomm-1.0
WANTLIB += enchant-2 epoxy fontconfig freetype gc gdk-3 gdk_pixbuf-2.0
WANTLIB += gdkmm-3.0 gio-2.0 giomm-2.4 glib-2.0 glibmm-2.4 gmodule-2.0
WANTLIB += gobject-2.0 gsl gslcblas gspell-1 gtk-3 gtkmm-3.0 gtksourceview-4
WANTLIB += harfbuzz iconv intl jpeg lcms2 m pango-1.0 pangocairo-1.0
WANTLIB += pangoft2-1.0 pangomm-1.4 png poppler poppler-glib potrace
WANTLIB += sigc-2.0 xml2 xslt z

SITES =		https://media.inkscape.org/dl/resources/file/
EXTRACT_SUFX =	.tar.xz

MODULES =	devel/cmake \
		lang/python \
		lang/ruby

COMPILER =	base-clang ports-gcc

# We are just substituting paths at build time
MODRUBY_BUILDDEP =	No

# There are no (enabled) ruby extensions yet, but users may like
# to write their own extensions. Add Ruby as a soft dependency.
# Note that Python is already pulled in indirectly by py-lxml.
MODRUBY_RUNDEP =	No

BUILD_DEPENDS =	devel/gettext,-tools \
		devel/gtest

LIB_DEPENDS =	devel/boost \
		devel/boehm-gc \
		devel/gsl \
		devel/pango \
		geo/lib2geom>=1.4 \
		graphics/ImageMagick \
		graphics/lcms2 \
		graphics/png \
		graphics/potrace \
		print/poppler \
		textproc/gspell \
		textproc/libxslt \
		x11/gtk+3 \
		x11/gtk3mm \
		x11/gtksourceview4

RUN_DEPENDS =	devel/desktop-file-utils \
		devel/gettext,-runtime \
		fonts/liberation-fonts \
		math/py-numpy \
		print/transfig \
		textproc/py-cssselect \
		textproc/py-lxml \
		www/py-requests \
		x11/gtk+4,-guic

WRKDIST =	${WRKDIR}/inkscape-${VERSION}_2025-03-30_93de688d07

SUBST_VARS +=	RUBY MODRUBY_REV

pre-configure:
	# As discussed on the ports mailing list, remove internationalised
	# manual pages, as our mandoc implementation does not yet deal with
	# them properly.
	rm  ${WRKDIST}/man/{inkscape,inkview}.*.pod.in
	find ${WRKDIST} -name i18n.py \
		-exec sed -i 's,python,${MODPY_BIN},' {} +;
	${SUBST_CMD} ${WRKDIST}/src/extension/implementation/script.cpp \
		${WRKDIST}/src/inkscape-main.cpp

post-install:
	${MODPY_COMPILEALL} ${PREFIX}/share/inkscape/extensions

.include <bsd.port.mk>
