COMMENT=		Nebulous rewrite of Tower Toppler

DISTNAME=		toppler-1.1.6
REVISION=		6
CATEGORIES=		games

HOMEPAGE=		https://toppler.sourceforge.net/

# GPLv3
PERMIT_PACKAGE=	Yes

WANTLIB += FLAC SDL SDL_mixer c iconv intl m ogg pthread smpeg sndio
WANTLIB += ${COMPILER_LIBCXX} usbhid vorbis vorbisfile z mikmod

COMPILER =		base-clang ports-gcc base-gcc

SITES=			${SITE_SOURCEFORGE:=toppler/}

LIB_DEPENDS=		audio/libmikmod \
			devel/gettext,-runtime \
			devel/sdl-mixer

RUN_DEPENDS=		devel/desktop-file-utils

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV=		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib"
LOCALSTATEDIR=		${BASELOCALSTATEDIR}/games

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/toppler
	${INSTALL_DATA} /dev/null ${PREFIX}/share/examples/toppler/toppler.hsc

.include <bsd.port.mk>
