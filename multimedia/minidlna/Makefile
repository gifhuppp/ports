COMMENT=		lightweight DLNA/UPnP-AV media server (aka ReadyMedia)

# two patches on top of latest upstreamr release:
# 'Rewrite dangerous system(3) "rm -rf ..." in standard library code'
# 'OpenBSD: use pledge(2) and unveil(2)'
COMMIT=			edebefe5725138402e43412c7bb10c3eb54a1b25
DIST_TUPLE=		github	klemensn	minidlna ${COMMIT}	.
PKGNAME=		minidlna-1.3.3
REVISION=		4

# due to ffmpeg's libavcodec
USE_NOBTCFI-amd64=	Yes

DEBUG_PACKAGES=		${BUILD_PACKAGES}

CATEGORIES=		multimedia

HOMEPAGE=		https://sourceforge.net/projects/minidlna/

MAINTAINER=		Klemens Nanni <kn@openbsd.org>

# GPLv2 only
PERMIT_PACKAGE=	Yes

# uses pledge() and unveil()
WANTLIB += FLAC avcodec avformat avutil c exif iconv id3tag intl jpeg
WANTLIB += ogg pthread sqlite3 vorbis z

# sometimes https://github.com/glebius/minidlna has useful things
#SITES=			${SITE_SOURCEFORGE:=minidlna/}

BUILD_DEPENDS=		devel/gettext,-tools

LIB_DEPENDS=		audio/flac \
			audio/libid3tag \
			databases/sqlite3 \
			graphics/ffmpeg \
			graphics/jpeg \
			graphics/libexif

CONFIGURE_STYLE=	autoreconf
AUTOCONF_VERSION=	2.71
AUTOMAKE_VERSION=	1.17

CONFIGURE_ENV=		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib -L${X11BASE}/lib"

CONFIGURE_ARGS=		--with-log-path=/var/log/minidlna \
			--with-db-path=/var/db/minidlna \
			--with-os-url=https://www.openbsd.org/

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/minidlna
	${INSTALL_DATA} ${WRKSRC}/minidlna.conf \
		${PREFIX}/share/examples/minidlna/
	${INSTALL_MAN} ${WRKSRC}/minidlnad.8 ${PREFIX}/man/man8
	${INSTALL_MAN} ${WRKSRC}/minidlna.conf.5 ${PREFIX}/man/man5

.include <bsd.port.mk>
