COMMENT=	WMF handling and conversion library

DISTNAME=	libwmf-0.2.8.4
REVISION=	8
SHARED_LIBS=	wmf		8.0	\
		wmf-0.2		8.0	\
		wmflite		7.1	\
		wmflite-0.2	7.1

CATEGORIES=	graphics devel

HOMEPAGE=	https://wvware.sourceforge.net/

# GPLv2+
PERMIT_PACKAGE=	Yes

WANTLIB =  X11 Xau Xdmcp c expat freetype jpeg m png pthread xcb z

SITES=		${SITE_SOURCEFORGE:=wvware/}

LIB_DEPENDS=	graphics/jpeg \
		graphics/png

CONFIGURE_STYLE= gnu
CONFIGURE_ARGS=	--with-png=${LOCALBASE} \
		--with-freetype=${X11BASE} \
		--with-jpeg=${LOCALBASE} \
		--with-zlib=/usr \
		--with-gsfontdir=${LOCALBASE}/share/fonts/ghostscript \
		--disable-gd
CONFIGURE_ENV=	PKG_CONFIG="/usr/bin/false"

.include <bsd.port.mk>
