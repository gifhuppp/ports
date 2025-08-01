PORTROACH=	limitw:1,even

BROKEN-hppa=	src/core/ngx_rwlock.c:116:2: error: \#error ngx_atomic_cmp_set() is not defined!

COMMENT-main=		robust and small HTTP server and mail proxy server
COMMENT-cache_purge=	nginx module which adds ability to purge cache content
COMMENT-geoip2=		nginx GeoIP2 module
COMMENT-headers_more=	nginx module for setting/adding/clearing headers
COMMENT-image_filter=	nginx image filter module
COMMENT-ldap_auth=	nginx LDAP authentication module
COMMENT-lua=		nginx lua scripting (lua-nginx-module and ngx_devel_kit)
COMMENT-mailproxy=	nginx mail proxy module
COMMENT-modsecurity=	nginx module for ModSecurity
COMMENT-naxsi=		nginx web application firewall module
COMMENT-njs=		nginx javascript scripting module
COMMENT-passenger=	nginx passenger (ruby/python/nodejs) integration module
COMMENT-perl=		nginx perl scripting module
COMMENT-rtmp=		nginx module for RTMP streaming
COMMENT-securelink=	nginx HMAC secure link module
COMMENT-stream=		nginx TCP/UDP proxy module
COMMENT-xslt=		nginx XSLT filter module

VERSION=	1.28.0
REVISION=	1
REVISION-njs=		2
REVISION-passenger=	2
DISTNAME=	nginx-${VERSION}
CATEGORIES=	www

PKGNAME-main=		${DISTNAME}
PKGNAME-cache_purge=	nginx-cache_purge-${VERSION}
PKGNAME-geoip2=		nginx-geoip2-${VERSION}
PKGNAME-headers_more=	nginx-headers-more-${VERSION}
PKGNAME-image_filter=	nginx-image_filter-${VERSION}
PKGNAME-ldap_auth=	nginx-ldap_auth-${VERSION}
PKGNAME-lua=		nginx-lua-${VERSION}
PKGNAME-mailproxy=	nginx-mailproxy-${VERSION}
PKGNAME-modsecurity=	nginx-modsecurity-${VERSION}
PKGNAME-naxsi=		nginx-naxsi-${VERSION}
PKGNAME-njs=		nginx-njs-${VERSION}
PKGNAME-passenger=	nginx-passenger-${VERSION}
PKGNAME-perl=		nginx-perl-${VERSION}
PKGNAME-rtmp=		nginx-rtmp-${VERSION}
PKGNAME-securelink=	nginx-securelink-${VERSION}
PKGNAME-stream=		nginx-stream-${VERSION}
PKGNAME-xslt=		nginx-xslt-${VERSION}

ONLY_FOR_ARCHS-passenger= aarch64 amd64 arm i386

SITES=	https://nginx.org/download/
SITES.p=https://raw.githubusercontent.com/rnagy/nginx_chroot_patch/master/ \
	https://raw.githubusercontent.com/sthen/nginx_chroot_patch/add_1.20.1/

DIST_TUPLE=	\
	github FRiCKLE ngx_cache_purge 2.3 ngx_cache_purge \
	github leev ngx_http_geoip2_module 3.4 ngx_http_geoip2_module \
	github openresty headers-more-nginx-module v0.34 headers-more-nginx-module \
	github kvspb nginx-auth-ldap 83c059b73566c2ee9cbda920d91b66657cf120b7 nginx-auth-ldap \
	github openresty lua-nginx-module v0.10.11 lua-nginx-module \
	github vision5 ngx_devel_kit v0.3.3 ngx_devel_kit \
	github nbs-system naxsi d714f1636ea49a9a9f4f06dba14aee003e970834 naxsi \
	github nginx njs 0.9.1 njs \
	github arut nginx-rtmp-module v1.2.2 nginx-rtmp-module \
	github nginx-modules ngx_http_hmac_secure_link_module 48c4625fbbf51ed5a95bfec23fa444f6c3702e50 ngx_http_hmac_secure_link_module \
	github owasp-modsecurity ModSecurity-nginx v1.0.3 ModSecurity-nginx

HOMEPAGE=	https://nginx.org/

HOMEPAGE-cache_purge=	https://github.com/FRiCKLE/ngx_cache_purge
HOMEPAGE-geoip2=	https://github.com/leev/ngx_http_geoip2_module
HOMEPAGE-headers_more=	https://github.com/openresty/headers-more-nginx-module
HOMEPAGE-ldap_auth=	https://github.com/kvspb/nginx-auth-ldap
HOMEPAGE-lua=		https://github.com/openresty/lua-nginx-module
HOMEPAGE-modsecurity=	https://github.com/owasp-modsecurity/ModSecurity-nginx
HOMEPAGE-naxsi=		https://github.com/wargio/naxsi
HOMEPAGE-njs=		https://github.com/nginx/njs
HOMEPAGE-passenger=	https://www.phusionpassenger.com/
HOMEPAGE-rtmp=		https://github.com/arut/nginx-rtmp-module
HOMEPAGE-securelink=	https://github.com/nginx-modules/ngx_http_hmac_secure_link_module

MAINTAINER=	Robert Nagy <robert@openbsd.org>

# nginx, cache_purge, geoip2, headers_more, ldap_auth, njs, rtmp: BSD-like
# passenger: MIT
# securelink: unlicensed
# naxsi: GPLv3
# modsecurity: Apache2
PERMIT_PACKAGE=	Yes

MULTI_PACKAGES =	-main -naxsi -perl ${MODULE_PACKAGES}

MODULE_PACKAGES =	-cache_purge -geoip2 -headers_more \
			-image_filter -ldap_auth -lua -mailproxy \
			-modsecurity -njs -passenger -rtmp \
			-securelink -stream -xslt

FLAVOR ?=
PSEUDO_FLAVORS =	no_lua no_modsecurity no_njs no_passenger

COMPILER =		base-clang ports-gcc base-gcc

.include <bsd.port.arch.mk>

WANTLIB-main=		c crypto pcre2-8 ssl z
WANTLIB-cache_purge=
WANTLIB-geoip2=		maxminddb
WANTLIB-headers_more=
WANTLIB-image_filter=	gd
WANTLIB-ldap_auth=	ldap
WANTLIB-lua=		${MODLUA_WANTLIB} m pcre
WANTLIB-mailproxy=
WANTLIB-modsecurity=	modsecurity
WANTLIB-naxsi=
WANTLIB-njs=		exslt m xml2 xslt
WANTLIB-passenger=	m pthread ${COMPILER_LIBCXX}
WANTLIB-perl=		c m perl
WANTLIB-rtmp=
WANTLIB-securelink=	crypto
WANTLIB-stream=
WANTLIB-xslt=		exslt xml2 xslt

LIB_DEPENDS-main=	devel/pcre2
LIB_DEPENDS-cache_purge=
LIB_DEPENDS-geoip2=	net/libmaxminddb
LIB_DEPENDS-image_filter=graphics/gd
LIB_DEPENDS-ldap_auth=	databases/openldap
LIB_DEPENDS-lua=	${MODLUA_LIB_DEPENDS} \
			devel/pcre
LIB_DEPENDS-modsecurity=	security/libmodsecurity
LIB_DEPENDS-njs=	devel/pcre2 \
			textproc/libxslt \
			textproc/libxml
LIB_DEPENDS-rtmp=
LIB_DEPENDS-securelink=
LIB_DEPENDS-xslt=	textproc/libxml \
			textproc/libxslt

MODLUA_RUNDEP=		No
RUN_DEPENDS=		www/nginx,-main=${VERSION}
RUN_DEPENDS-main=	# blank (override default)
RUN_DEPENDS-lua=	${RUN_DEPENDS} \
			${_MODLUA_RUN_DEPENDS} \
			devel/pcre
RUN_DEPENDS-passenger=	${RUN_DEPENDS} \
			ruby*-passenger-*:www/ruby-passenger

NGINX_DIR=	/var/www
SUBST_VARS=	NGINX_DIR

.for i in ${MODULE_PACKAGES}
PREFIX$i=	${NGINX_DIR}/modules
.endfor

CFLAGS+=	-Wall -Wpointer-arith \
		-I ${WRKSRC}/njs/src \
		-I "${LOCALBASE}/include/libxml2" \
		-I "${LOCALBASE}/include"
LDFLAGS+=	-L ${LOCALBASE}/lib -L ${X11BASE}/lib
CONFIGURE_ENV+=	LDFLAGS="${LDFLAGS}"

PATCHFILES.p+=		nginx-1.20.1-chroot.patch
PATCH_DIST_STRIP=	-p1

CONFIGURE_STYLE=	simple
MODULES+=		perl

.if ${BUILD_PACKAGES:M-lua}
MODULES+=		lang/lua
CONFIGURE_ENV+=		MODLUA_INCL_DIR=${MODLUA_INCL_DIR} \
			MODLUA_LIB=${MODLUA_LIB}
CONFIGURE_ARGS+=	--add-dynamic-module=${WRKSRC}/lua-nginx-module
.endif

.if ${BUILD_PACKAGES:M-modsecurity}
CONFIGURE_ENV+=		MODSECURITY_INC=${LOCALBASE}/include/modsecurity \
			MODSECURITY_LIB=${LOCALBASE}/lib
CONFIGURE_ARGS+=	--add-dynamic-module=${WRKSRC}/ModSecurity-nginx
.endif

.if ${BUILD_PACKAGES:M-passenger}
MODULES+=		lang/ruby
MODRUBY_BUILDDEP=	No
MODRUBY_RUNDEP=		No
BUILD_DEPENDS+=		${MODRUBY_PKG_PREFIX}-passenger-*:www/ruby-passenger
CONFIGURE_ARGS+=	--add-dynamic-module=${LOCALBASE}/lib/phusion-passenger${GEM_BIN_SUFFIX}/src/nginx_module
.endif

.if ${BUILD_PACKAGES:M-rtmp}
CONFIGURE_ARGS+=	--add-dynamic-module=${WRKSRC}/nginx-rtmp-module
.endif

.if ${BUILD_PACKAGES:M-njs}
CONFIGURE_ARGS+=	--add-dynamic-module=${WRKSRC}/njs/nginx
.endif

CONFIGURE_ARGS+=	--prefix=${NGINX_DIR} \
			--conf-path=${SYSCONFDIR}/nginx/nginx.conf \
			--sbin-path=${PREFIX}/sbin/nginx \
			--pid-path=/var/run/nginx.pid \
			--lock-path=/var/run/nginx.lock \
			--http-log-path=logs/access.log \
			--error-log-path=logs/error.log \
			--http-client-body-temp-path=${NGINX_DIR}/cache/client_body_temp \
			--http-proxy-temp-path=${NGINX_DIR}/cache/proxy_temp \
			--http-fastcgi-temp-path=${NGINX_DIR}/cache/fastcgi_temp \
			--http-scgi-temp-path=${NGINX_DIR}/cache/scgi_temp \
			--http-uwsgi-temp-path=${NGINX_DIR}/cache/uwsgi_temp \
			--user=www \
			--group=www \
			--with-http_auth_request_module \
			--with-http_dav_module \
			--with-http_image_filter_module=dynamic \
			--with-http_gzip_static_module \
			--with-http_gunzip_module \
			--with-http_perl_module=dynamic \
			--with-http_realip_module \
			--with-http_slice_module \
			--with-http_ssl_module \
			--with-http_stub_status_module \
			--with-http_v2_module \
			--with-http_v3_module \
			--with-http_xslt_module=dynamic \
			--with-mail=dynamic \
			--with-stream=dynamic \
			--with-stream_ssl_module \
			--with-stream_ssl_preread_module \
			--add-dynamic-module=${WRKSRC}/naxsi/naxsi_src/ \
			--add-dynamic-module=${WRKSRC}/ngx_devel_kit \
			--add-dynamic-module=${WRKSRC}/headers-more-nginx-module \
			--add-dynamic-module=${WRKSRC}/nginx-auth-ldap \
			--add-dynamic-module=${WRKSRC}/ngx_http_geoip2_module \
			--add-dynamic-module=${WRKSRC}/ngx_http_hmac_secure_link_module \
			--add-dynamic-module=${WRKSRC}/ngx_cache_purge

SUBSTFILES=		conf/nginx.conf */config

NO_TEST=		Yes
ALL_TARGET=

pre-configure:
	@cd ${WRKSRC} && ${SUBST_CMD} ${SUBSTFILES}

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/nginx/
	${INSTALL_PROGRAM} ${WRKSRC}/objs/nginx ${PREFIX}/sbin
	${INSTALL_MAN} ${WRKSRC}/objs/nginx.8 ${PREFIX}/man/man8/
.for i in koi-win koi-utf win-utf mime.types nginx.conf \
	fastcgi_params scgi_params uwsgi_params
	${INSTALL_DATA} ${WRKSRC}/conf/${i} ${PREFIX}/share/nginx/
.endfor
	${INSTALL_DATA} ${WRKSRC}/naxsi/naxsi_config/naxsi_core.rules \
		${PREFIX}/share/nginx/
	${INSTALL_DATA_DIR} ${PREFIX}/share/nginx/html/
	${INSTALL_DATA} ${WRKSRC}/html/* ${PREFIX}/share/nginx/html/
	${INSTALL_DATA_DIR} ${WRKINST}/var/www/modules/
	${INSTALL_DATA} ${WRKSRC}/objs/*.so ${WRKINST}/var/www/modules/
	${INSTALL_DATA_DIR} ${PREFIX}/${P5ARCH}/auto/nginx/
	${INSTALL_DATA} ${WRKSRC}/objs/src/http/modules/perl/blib/lib/nginx.pm \
		${PREFIX}/${P5ARCH}/
	${INSTALL_DATA} ${WRKSRC}/objs/src/http/modules/perl/blib/arch/auto/nginx/nginx.so \
		${PREFIX}/${P5ARCH}/auto/nginx/

.include <bsd.port.mk>
