COMMENT-main=		implementation of the iCalendar protocols and data units
COMMENT-glib=		GObject wrapper for libical library

V=			3.0.20
DISTNAME=		libical-${V}

PKGNAME-main=		${PKGNAME}
PKGNAME-glib=		libical-glib-${V}

SHARED_LIBS +=  ical                 4.5
SHARED_LIBS +=  icalss               4.0
SHARED_LIBS +=  icalvcal             3.0
SHARED_LIBS +=  ical_cxx             1.1
SHARED_LIBS +=  icalss_cxx           1.0
SHARED_LIBS +=  ical-glib            0.0

CATEGORIES=		textproc

HOMEPAGE=		https://libical.github.io/libical/

MAINTAINER=		Antoine Jacoutot <ajacoutot@openbsd.org>

# dual MPLv2, LGPLv2.1
PERMIT_PACKAGE=	Yes

WANTLIB += icui18n icudata icuuc
WANTLIB-main += ${WANTLIB} ${COMPILER_LIBCXX} m lib/db4/db lib/db4/db_cxx
WANTLIB-glib += ${WANTLIB} c ical glib-2.0 gobject-2.0 intl pthread xml2

SITES=		https://github.com/libical/libical/releases/download/v${V}/

MULTI_PACKAGES=		-main -glib

MODULES=		devel/cmake

COMPILER=		base-clang ports-gcc base-gcc

BUILD_DEPENDS=		devel/gobject-introspection \
			lang/vala \
			textproc/libxml

LIB_DEPENDS-main=	databases/db/v4 \
			textproc/icu4c

LIB_DEPENDS-glib=	devel/glib2 \
			textproc/libxml \
			${BASE_PKGPATH},-main=${V}


CONFIGURE_ARGS=		-DENABLE_GTK_DOC=false \
			-DGOBJECT_INTROSPECTION=true \
			-DICAL_GLIB_VAPI=true \
			-DICAL_BUILD_DOCS=false

DEBUG_PACKAGES=		${BUILD_PACKAGES}

CFLAGS +=		-I${LOCALBASE}/include

# needed for libical-glib tests
MODULES +=		lang/python
MODPY_RUNDEP=		No
TEST_DEPENDS=		${MODPY_RUN_DEPENDS} \
			textproc/libical,-glib=${V}

pre-configure:
	${SUBST_CMD} ${WRKSRC}/cmake/modules/FindBDB.cmake

.include <bsd.port.mk>
