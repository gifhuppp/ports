BROKEN =	needs modifying for neweer Perl; dead upstream

COMMENT =	collection of perl scripts to manage your iPod

DISTNAME =	gnupod-0.99.8
PKGNAME =	p5-${DISTNAME}
REVISION =	5
CATEGORIES =	audio

HOMEPAGE =	https://www.gnu.org/software/gnupod/
SITES =		http://blinkenlights.ch/gnupod-dist/stable/ \
		${SITE_SAVANNAH:=gnupod/}

# GPLv3
PERMIT_PACKAGE =	Yes

EXTRACT_SUFX =	.tgz
MODULES =	perl

CONFIGURE_STYLE =gnu

RUN_DEPENDS =	security/p5-Digest-SHA1 \
		textproc/p5-XML-Parser \
		converters/p5-Unicode-String \
		audio/p5-MP3-Info \
		www/p5-libwww \
		devel/p5-Time-TimeDate \
		audio/p5-Audio-FLAC-Header \
		audio/p5-Ogg-Vorbis-Header-PurePerl \
		graphics/ffmpeg \
		graphics/ImageMagick \
		net/curl \
		audio/flac \
		audio/lame \
		audio/vorbis-tools
BUILD_DEPENDS=	${RUN_DEPENDS}

NO_TEST =	Yes

post-install:
	gunzip ${PREFIX}/man/man1/*.1.gz
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/gnupod
	${INSTALL_DATA} ${WRKSRC}/doc/gnupodrc.example \
		${PREFIX}/share/examples/gnupod/gnupodrc

.include <bsd.port.mk>
