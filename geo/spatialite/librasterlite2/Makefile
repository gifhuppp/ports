COMMENT =	store rasters coverages within spatialite
PROJECT =	librasterlite2
REVISION =	3
DISTNAME =	${PROJECT}-1.1.0-beta1
PKGNAME =	${DISTNAME:S/-beta/beta/}
SHARED_LIBS +=	rasterlite2 0.0 # 1.0

LIB_DEPENDS +=	geo/spatialite/libspatialite>=5.0.0 \
		geo/librttopo \
		graphics/openjp2 \
		databases/sqlite3 \
		archivers/xz \
		archivers/minizip \
		net/curl \
		graphics/cairo \
		graphics/libwebp \
		devel/geotiff

WANTLIB += Lerc X11 Xext Xrender c cairo crypto curl expat fontconfig
WANTLIB += freetype freexl geos geos_c geotiff gif iconv jpeg lzma m
WANTLIB += nghttp2 pixman-1 png proj pthread spatialite sqlite3
WANTLIB += ssl ${COMPILER_LIBCXX} tiff webp xcb xcb-render xcb-shm xml2 z
WANTLIB += bz2 lz4 minizip openjp2 rttopo zstd Xau Xdmcp
WANTLIB += nghttp3 ngtcp2 ngtcp2_crypto_quictls sharpyuv

COMPILER =		base-clang ports-gcc base-gcc

# needed for check_sql_stmt test to succeed - it loads mod_rasterlite2
TEST_DEPENDS =	${BUILD_PKGPATH}

.include <bsd.port.mk>
