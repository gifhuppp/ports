COMMENT-main =		syslog daemon supporting databases, TCP, SSL, RELP
COMMENT-mysql =		MySQL plugin for rsyslog
COMMENT-normalize =	liblognorm plugin for rsyslog
COMMENT-pgsql =		PostgreSQL plugin for rsyslog
COMMENT-elasticsearch =	Elasticsearch plugin for rsyslog

MULTI_PACKAGES =	-main -mysql -normalize -pgsql -elasticsearch

V =			8.2404.0
DISTNAME =		rsyslog-$V
PKGNAME-main =		rsyslog-$V
PKGNAME-mysql =		rsyslog-mysql-$V
PKGNAME-normalize =	rsyslog-normalize-$V
PKGNAME-pgsql =		rsyslog-pgsql-$V
PKGNAME-elasticsearch =	rsyslog-elasticsearch-$V
REVISION =		0

CATEGORIES =		sysutils

HOMEPAGE =		https://www.rsyslog.com/

# GPLv3+
PERMIT_PACKAGE =	Yes

COMPILER =		base-clang ports-gcc base-gcc
COMPILER_LANGS =	c

WANTLIB-main +=		c crypto curl estr fastjson gcrypt gmp gnutls
WANTLIB-main +=		gpg-error hogweed iconv idn2 intl m nettle nghttp2
WANTLIB-main +=		p11-kit pthread relp ssl tasn1 unistring uuid z
WANTLIB-main +=		execinfo nghttp3 ngtcp2 ngtcp2_crypto_quictls

WANTLIB-mysql +=	crypto m mariadb pthread ssl z

WANTLIB-normalize +=	estr fastjson lognorm pthread

WANTLIB-pgsql +=	crypto m pq pthread ssl

WANTLIB-elasticsearch +=	crypto curl m nghttp2 pthread ssl z
WANTLIB-elasticsearch +=	nghttp3 ngtcp2 ngtcp2_crypto_quictls

LIB_DEPENDS-main =	devel/libfastjson \
			devel/libestr \
			net/curl \
			security/libgcrypt \
			security/gnutls \
			sysutils/librelp>=1.2.14
# XXX should port to using libc UUID functions
LIB_DEPENDS-main +=	sysutils/e2fsprogs
LIB_DEPENDS-mysql =	databases/mariadb
RUN_DEPENDS-mysql =	${PKGNAME-main}:${PKGPATH},-main
LIB_DEPENDS-normalize =	devel/liblognorm
RUN_DEPENDS-normalize = ${PKGNAME-main}:${PKGPATH},-main
LIB_DEPENDS-pgsql =	databases/postgresql
RUN_DEPENDS-pgsql =	${PKGNAME-main}:${PKGPATH},-main
RUN_DEPENDS-elasticsearch =	${PKGNAME-main}:${PKGPATH},-main

SITES =			https://www.rsyslog.com/files/download/rsyslog/

CONFIGURE_STYLE =	gnu
LIBTOOL_FLAGS =		--tag=disable-static
CONFIGURE_ARGS +=	--enable-pgsql \
			--enable-mysql \
			--enable-mail \
			--enable-mmnormalize \
			--enable-gnutls \
			--enable-openssl \
			--enable-relp \
			--enable-elasticsearch \
			--enable-imfile
CONFIGURE_ENV +=	CPPFLAGS="-I${LOCALBASE}/include"

post-install:
	rm ${PREFIX}/lib/rsyslog/*.la
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/rsyslog
	${SUBST_DATA} ${FILESDIR}/rsyslog.conf \
	    ${PREFIX}/share/examples/rsyslog/rsyslog.conf
	${INSTALL_DATA} ${WRKSRC}/plugins/ommysql/createDB.sql \
	    ${PREFIX}/share/examples/rsyslog/createDB_mysql.sql
	${INSTALL_DATA} ${WRKSRC}/plugins/ompgsql/createDB.sql \
	    ${PREFIX}/share/examples/rsyslog/createDB_pgsql.sql

.include <bsd.port.mk>
