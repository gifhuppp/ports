V=		4.7.0
COMMENT=	motion detection software for video

GH_ACCOUNT=	Motion-Project
GH_PROJECT=	motion
GH_TAGNAME=	release-$V

CATEGORIES=	multimedia

HOMEPAGE=	https://motion-project.github.io/

MAINTAINER=	Stuart Henderson <stu.ports@spacehopper.org>

# GPL (according to source files, v2 only. website says v2+).
PERMIT_PACKAGE=	Yes

WANTLIB += avcodec avdevice avformat avutil c iconv intl jpeg
WANTLIB += microhttpd pthread sqlite3 swscale webp webpmux

FLAVOR?=
FLAVORS=		mysql pgsql

FLAVOR_COMMA=		${FLAVOR_EXT:S/-/,/g}
SUBST_VARS=		FLAVOR_COMMA

BUILD_DEPENDS=		devel/gettext,-tools
LIB_DEPENDS=		databases/sqlite3 \
			graphics/jpeg \
			graphics/ffmpeg \
			graphics/libwebp \
			www/libmicrohttpd

FAKE_FLAGS=		docdir=${PREFIX}/share/doc/motion \
			sysconfdir=${PREFIX}/share/examples
FAKE_TARGET=		install install-data

USE_GMAKE=		Yes
CONFIGURE_STYLE=	autoreconf
AUTOCONF_VERSION=	2.69
AUTOMAKE_VERSION=	1.16
CONFIGURE_ARGS=		--without-optimizecpu \
			LDFLAGS="-L${LOCALBASE}/lib" \
			CPPFLAGS="-I${LOCALBASE}/include"

.if ${FLAVOR:L:Mmysql}
LIB_DEPENDS+=		databases/mariadb
WANTLIB+=		mariadb
.else
CONFIGURE_ARGS+=	--without-mysql --without-mariadb
.endif

.if ${FLAVOR:L:Mpgsql}
LIB_DEPENDS+=		databases/postgresql
WANTLIB+=		pq
CONFIGURE_ARGS+=	--with-pgsql-lib=${LOCALBASE}/lib
.else
CONFIGURE_ARGS+=	--without-pgsql
.endif

.if ${MACHINE_ARCH} == amd64
CFLAGS+=	-mfpmath=sse -msse3
.endif

NO_TEST=		Yes

pre-configure:
	perl -pi -e s,/usr/local/etc,${SYSCONFDIR},g \
		${WRKSRC}/motion-dist.conf.in

.include <bsd.port.mk>
