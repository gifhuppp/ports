COMMENT=	library to split mp3/ogg files without decoding

DISTNAME=	libmp3splt-0.9.2
REVISION=	1

SHARED_LIBS +=	mp3splt                   1.0 # .0.5
SHARED_LIBS +=	splt_mp3                  0.0 # 0.0
SHARED_LIBS +=	splt_ogg                  0.0 # 0.0
SHARED_LIBS +=	splt_flac                 0.0 # 0.0

CATEGORIES=	audio

HOMEPAGE=	https://mp3splt.sourceforge.net/

# GPLv2+
PERMIT_PACKAGE=	Yes

WANTLIB =  FLAC id3tag ltdl m mad ogg pcre pthread vorbis vorbisfile z

SITES=		${SITE_SOURCEFORGE:=mp3splt/}

LIB_DEPENDS=	audio/flac \
		audio/libmad \
		audio/libvorbis \
		audio/libid3tag \
		devel/libtool,-ltdl \
		devel/pcre

# required for static linking
LIB_DEPENDS +=	audio/libogg
LIBTOOL_FLAGS =	--tag=disable-static

CONFIGURE_STYLE=gnu
CONFIGURE_ARGS= --disable-nls \
		--disable-optimise \
		--disable-doxygen_doc \
		--with-ogg="${LOCALBASE}" \
		--with-vorbis="${LOCALBASE}" 
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
