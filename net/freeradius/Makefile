COMMENT-main=	RADIUS server implementation
COMMENT-freetds= freeradius freetds rlm addon
COMMENT-iodbc=	freeradius iodbc rlm addon
COMMENT-ldap=	freeradius ldap rlm addon
COMMENT-memcached= freeradius memcached rlm addon
COMMENT-mysql=	freeradius mysql rlm addon
COMMENT-pgsql=	freeradius pgsql rlm addon
COMMENT-python3= freeradius python3 rlm addon

V=		3.2.6
REVISION-python3= 0
DISTNAME=	freeradius-server-$V
EXTRACT_SUFX=	.tar.bz2

PKGNAME-main=	freeradius-$V
PKGNAME-freetds= freeradius-freetds-$V
PKGNAME-iodbc=	freeradius-iodbc-$V
PKGNAME-ldap=	freeradius-ldap-$V
PKGNAME-memcached= freeradius-memcached-$V
PKGNAME-mysql=	freeradius-mysql-$V
PKGNAME-pgsql=	freeradius-pgsql-$V
PKGNAME-python3= freeradius-python3-$V

CATEGORIES=	net security

SITES=		https://ftp.cc.uoc.gr/mirrors/ftp.freeradius.org/ \
		ftp://ftp.freeradius.org/pub/freeradius/ \
		ftp://ftp.freeradius.org/pub/freeradius/old/

HOMEPAGE=	https://freeradius.org/

MAINTAINER=	Stuart Henderson <stu.ports@spacehopper.org>

# GPLv2 - LGPLv2 - OpenSSL exemption
PERMIT_PACKAGE=	Yes

DEBUG_PACKAGES=	${BUILD_PACKAGES}

CONFIGURE_STYLE= gnu
# Don't allow FR_LOCATE_DIR to use locate(1) to guess possible
# locations for libs etc.
CONFIGURE_ENV=	ac_cv_path_LOCATE= \
		ac_cv_path_SNMPGET=${LOCALBASE}/bin/snmpget \
		ac_cv_path_SNMPWALK=${LOCALBASE}/bin/snmpwalk \
		CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="${LDFLAGS} -L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--libdir=${PREFIX}/lib/freeradius \
		--without-rlm_eap_teap \
		--without-rlm_mongo \
		--without-rlm_oracle \
		--without-rlm_pam \
		--without-rlm_python
# No option to disable collectd; bodged via patch-configure.

TEST_TARGET=	test
TEST_DEPENDS=	freeradius-$V:${BUILD_PKGPATH}
TEST_IS_INTERACTIVE=Yes # doesn't exit properly
# For manual tests, eapol_test from wpa_supplicant is useful.
# See http://deployingradius.com/scripts/eapol_test/

MODULES=	lang/python

# thread-local storage
COMPILER =	base-clang ports-gcc
COMPILER_LANGS = c

MULTI_PACKAGES= -main -freetds -iodbc -ldap -memcached -mysql -pgsql -python3

USE_GMAKE=	Yes
USE_LIBTOOL=	no#...uses jlibtool, which is compiled during build

RUN_DEPENDS-main=	#empty
LIB_DEPENDS-main=	databases/gdbm \
			databases/libhiredis \
			databases/sqlite3 \
			devel/json-c \
			devel/libtalloc \
			net/libunbound \
			security/yubico/yubico-c \
			security/yubico/yubico-c-client \
			devel/pcre \
			net/curl

WANTLIB-main += c crypto curl execinfo gdbm hiredis json-c m
WANTLIB-main += pcap pcre perl pthread readline sqlite3 ssl talloc
WANTLIB-main += unbound ykclient yubikey

.for i in ${MULTI_PACKAGES:N-main}
PSEUDO_FLAVORS+= no_${i:S/-//}
.endfor
FLAVOR?=

.include <bsd.port.arch.mk>

# rlm_python3
.if ${BUILD_PACKAGES:M-python3}
CONFIGURE_ARGS+=	--with-rlm_python3
.else
CONFIGURE_ARGS+=	--without-rlm_python3
.endif
LIB_DEPENDS-python3=	${MODPY_LIB_DEPENDS}
WANTLIB-python3=	${MODPY_WANTLIB} intl m pthread util
RUN_DEPENDS-python3=	${MODPY_RUN_DEPENDS}

# rlm_ldap
.if ${BUILD_PACKAGES:M-ldap}
CONFIGURE_ARGS+=	--with-ldap-lib-dir=${LOCALBASE}/lib
CONFIGURE_ARGS+=	--with-ldap-include-dir=${LOCALBASE}/include
.else
CONFIGURE_ARGS+=	--without-rlm_ldap
.endif
LIB_DEPENDS-ldap=	databases/openldap
WANTLIB-ldap=		ldap
RUN_DEPENDS-ldap=	#empty

# rlm_sql_freetds
.if ${BUILD_PACKAGES:M-freetds}
CONFIGURE_ARGS+=	--with-freetds-lib-dir=${LOCALBASE}/lib
CONFIGURE_ARGS+=	--with-freetds-include-dir=${LOCALBASE}/include
.else
CONFIGURE_ARGS+=	--without-rlm_sql_freetds
.endif
LIB_DEPENDS-freetds=	databases/freetds
WANTLIB-freetds=	ct

# rlm_sql_iodbc
.if ${BUILD_PACKAGES:M-iodbc}
CONFIGURE_ARGS+=	--with-iodbc-lib-dir=${LOCALBASE}/lib
CONFIGURE_ARGS+=	--with-iodbc-include-dir=${LOCALBASE}/include
.else
CONFIGURE_ARGS+=	--without-rlm_sql_iodbc
.endif
LIB_DEPENDS-iodbc=	databases/iodbc
WANTLIB-iodbc=		iodbc>=2
RUN_DEPENDS-iodbc=	#empty

# rlm_sql_memcached
.if ! ${BUILD_PACKAGES:M-memcached}
CONFIGURE_ARGS+=	--without-rlm_sql_memcached
.endif
LIB_DEPENDS-memcached=	devel/libmemcached
WANTLIB-memcached=	memcached pthread
RUN_DEPENDS-memcached=	#empty

# rlm_sql_mysql
.if ${BUILD_PACKAGES:M-mysql}
CONFIGURE_ARGS+=	--with-mysql-lib-dir=${LOCALBASE}/lib
CONFIGURE_ARGS+=	--with-mysql-include-dir=${LOCALBASE}/include/mysql
.else
CONFIGURE_ARGS+=	--without-rlm_sql_mysql
.endif
LIB_DEPENDS-mysql=	databases/mariadb
WANTLIB-mysql=		mariadb
RUN_DEPENDS-mysql=	#empty

# rlm_sql_postgresql
.if ${BUILD_PACKAGES:M-pgsql}
CONFIGURE_ARGS+=	--with-rlm-sql-postgresql-lib-dir=${LOCALBASE}/lib
CONFIGURE_ARGS+=	--with-rlm-sql-postgresql-include-dir=${LOCALBASE}/include/postgresql
.else
CONFIGURE_ARGS+=	--without-rlm_sql_postgresql
.endif
LIB_DEPENDS-pgsql=	databases/postgresql
WANTLIB-pgsql=		pq
RUN_DEPENDS-pgsql=	#empty

.for i in ${MULTI_PACKAGES:N-main}
RUN_DEPENDS$i +=	freeradius-$V:net/freeradius
WANTLIB$i ?=		#empty
.endfor

FREERADIUS_ETC=	${SYSCONFDIR}/raddb
SUBST_VARS=	FREERADIUS_ETC
MAKE_FLAGS=	PACKAGE=openbsd VERBOSE=1
FAKE_FLAGS=	VERBOSE=1 R=${WRKINST} \
		raddbdir=${PREFIX}/share/examples/freeradius

post-configure:
	sed -i -e 's,/etc/raddb,${SYSCONFDIR}/raddb,g' ${WRKSRC}/man/*/*
	sed -i -e 's,/usr/local,${TRUEPREFIX},g' ${WRKSRC}/doc/README
	rm ${WRKSRC}/doc/README${PATCHORIG}

# pre-create examples dir, otherwise build tries to create it twice and fails.
pre-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/freeradius

post-install:
	rm ${PREFIX}/lib/freeradius/*.*a
	rm -r \
	    ${PREFIX}/share/examples/freeradius/mods-config/sql/*/oracle \
	    ${PREFIX}/share/examples/freeradius/mods-config/sql/*/mongo \
	    ${PREFIX}/share/examples/freeradius/mods-available/python \
	    ${PREFIX}/share/doc/freeradius/antora
	chmod -R u+rwX,og+rX ${PREFIX}/share/examples/freeradius/
	${SUBST_CMD} -c -m 555 ${FILESDIR}/freeradius-enable.sh \
	    ${PREFIX}/share/freeradius/freeradius-enable.sh

.include <bsd.port.mk>
