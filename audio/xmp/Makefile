COMMENT=		extended module player

DISTNAME=		xmp-4.2.0
CATEGORIES=		audio
REVISION=		0

HOMEPAGE=		https://xmp.sourceforge.net/

# GPLv2+
PERMIT_PACKAGE=	Yes

SITES=			${SITE_SOURCEFORGE:=xmp/}

WANTLIB += c sndio xmp

USE_GMAKE=		Yes

NO_TEST=		Yes

LIB_DEPENDS=		audio/libxmp

CONFIGURE_STYLE=	gnu
MODGNU_CONFIG_GUESS_DIRS= ${WRKSRC}/build-aux
CONFIGURE_ARGS+=	--disable-alsa \
			--disable-oss \
			--disable-pulseaudio
CONFIGURE_ENV=		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib"

# disable sun audio detection
CONFIGURE_ENV+=		ac_cv_header_sys_audioio_h=no

MAKE_FLAGS+=		V=1

FAKE_FLAGS=		DESTDIR=${WRKINST} \
			SYSCONFDIR=${PREFIX}/share/examples

.include <bsd.port.mk>
