COMMENT =	graphic library, pdf parser, viewer and utilities

SHARED_LIBS +=  mupdf                 12.1

V =		1.25.6
DISTNAME =	mupdf-$V-source
PKGNAME =	mupdf-${V:S/-rc/rc/}

CATEGORIES =	textproc x11

HOMEPAGE =	https://mupdf.com/

MAINTAINER =	Stuart Henderson <stu.ports@spacehopper.org>

# code: Affero v3
# CMap resources (Adobe): BSD
# fonts -
#   Droid: Apache
#   Charis SIL, Noto, Source Han Serif, URW Dingbats/Nimbus: OFL
PERMIT_PACKAGE =	Yes

# uses pledge(2)
WANTLIB += X11 Xext c curl freetype gumbo harfbuzz jbig2dec jpeg
WANTLIB += m openjp2 pthread z crypto

FLAVORS =	js
FLAVOR ?=

# http://git.ghostscript.com/?p=mupdf.git;a=summary
SITES =		https://mupdf.com/downloads/archive/

# tessocr.cpp
COMPILER =	base-clang ports-gcc

BUILD_DEPENDS =	shells/bash
RUN_DEPENDS =	devel/desktop-file-utils \
		devel/xdg-utils
LIB_DEPENDS =	devel/harfbuzz \
		graphics/jbig2dec \
		graphics/jpeg \
		graphics/openjp2>=2.0.1 \
		net/curl \
		www/gumbo

USE_GMAKE =	Yes
NO_TEST =	Yes

LDFLAGS =	-L${WRKSRC}/build/shared-release \
		-L${LOCALBASE}/lib \
		-L${X11BASE}/lib \
		-lgumbo

CPPFLAGS =	-I$(WRKSRC)/include \
		-I${X11BASE}/include \
		-I${X11BASE}/include/freetype2 \
		-I${LOCALBASE}/include/harfbuzz \
		-I${LOCALBASE}/include/openjpeg-2.5 \
		-I${LOCALBASE}/include
MAKE_FLAGS =	CC="${CC}" CXX="${CXX}" \
		XCFLAGS="${CFLAGS} -fPIC ${CPPFLAGS}" \
		LDFLAGS="${LDFLAGS}" LLD_EMUL="${LLD_EMUL}" \
		USE_SYSTEM_LIBS=yes \
		SYS_FREETYPE_LIBS=-lfreetype \
		HAVE_TESSERACT=no HAVE_LEPTONICA=no \
		SO_VERSION=.${LIBmupdf_VERSION:R}.${LIBmupdf_VERSION:E} \
		build=release shared=yes verbose=yes

FAKE_FLAGS =	prefix=${PREFIX} mandir=${PREFIX}/man

# build=release shared=yes verbose=yes

DEBUG_PACKAGES = ${BUILD_PACKAGES}

pre-configure:
	cd ${WRKSRC}; sed -i 's,/usr/X11R6/include,${X11BASE}/include,g' Makerules Makethird
# keeping internal copy of lcms2 which is a fork with API changes
# http://git.ghostscript.com/?p=thirdparty-lcms2.git;a=blob_plain;f=doc/WhyThisFork.txt;hb=lcms2mt
	rm -r ${WRKSRC}/thirdparty/{curl,freeglut,freetype,harfbuzz,jbig2dec,libjpeg,openjpeg,zlib} # use from ports
.if !${FLAVOR:Mjs}
	rm -r ${WRKSRC}/thirdparty/mujs # not building with javascript support
CFLAGS +=	-DFZ_ENABLE_JS=0
# disable mupdf-gl; it uses some parts of mujs internally so
# js support can't be knocked out completely
MAKE_FLAGS +=	HAVE_GLUT=No
.else
MAKE_FLAGS +=	ENABLE_MUJS=yes
WANTLIB +=	GL glut
LIB_DEPENDS +=	graphics/freeglut
.endif

# ld.bfd -r -b binary does not produce correct type of object.
.if ${MACHINE_ARCH:Mmips64*}
MAKE_FLAGS +=	HAVE_OBJCOPY=no
.endif

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/{applications,pixmaps}
	${INSTALL_DATA} ${FILESDIR}/mupdf.xpm ${PREFIX}/share/pixmaps/
	${INSTALL_DATA} ${FILESDIR}/mupdf.desktop ${PREFIX}/share/applications/
	cd ${PREFIX}/bin; ln -s mupdf-x11 mupdf
	mv ${PREFIX}/share/doc/mupdf/examples ${PREFIX}/share/examples/mupdf
.if !${FLAVOR:Mjs}
	rm ${PREFIX}/share/examples/mupdf/*.js
.endif

.include <bsd.port.mk>
