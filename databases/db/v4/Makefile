COMMENT-java=	Java bindings for Berkeley DB, revision ${REV}

REV=		4
VERSION=	${REV}.6.21
PKGSPEC-main=	db->=4,<5|db->=4v0,<5v0
PKGSPEC-java=	db-java->=4,<5|db-java->=4v0,<5v0
PKGSPEC-tcl=	db-tcl->=4,<5|db-tcl->=4v0,<5v0

REVISION-main=	8
REVISION-java=	14
REVISION-tcl=	5

EPOCH=		0
DBLIBDIR=	lib/db4

# XXX LIBdb_VERSION is used by x11/gnome/libgda
SHARED_LIBS +=	db                   5.0      # .0.0
SHARED_LIBS +=	db_cxx               6.0      # .0.0
SHARED_LIBS +=	db_java              5.0      # .0.0
SHARED_LIBS +=	db_tcl               6.0      # .0.0

COMPILER=		base-clang ports-gcc base-gcc

SITES.up=	${HOMEPAGE}db/update/${VERSION}/
# patch 2 has converted DOS line-endings; no other change
# patches 1,3,4 are just mirrored
SITES.stu=	https://spacehopper.org/mirrors/
PATCHFILES.stu=	patch.${VERSION}.1 \
		patch.${VERSION}.2.fixed \
		patch.${VERSION}.3 \
		patch.${VERSION}.4

CONFIGURE_STYLE= gnu

DEST_SUBDIR=	${REV}
LIB_DEPENDS-main=	${MODGCC4_CPPLIBDEP}
WANTLIB=	c m ${COMPILER_LIBCXX}

PSEUDO_FLAVORS=	no_java bootstrap
FLAVOR?=

MULTI_PACKAGES= -java
RUN_DEPENDS-java=	${BUILD_PKGPATH} \
			${MODJAVA_RUN_DEPENDS}
WANTLIB-java=

RUN_DEPENDS-tcl=	${BUILD_PKGPATH}

SUBST_VARS=	LIBdb_tcl_VERSION

pre-configure:
	@perl -pi -e "s,db_(archive|checkpoint|deadlock|dump|hotbackup),db5_\0,g" ${WRKSRC}/test/*tcl
	@perl -pi -e "s,db_(load|printlog|recover|stat|upgrade|verify),db5_\0,g" ${WRKSRC}/test/*tcl
	@${SUBST_CMD} ${WRKSRC}/test/include.tcl

.include <bsd.port.mk>
