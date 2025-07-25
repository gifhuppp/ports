COMMENT-main =		system metrics collection engine
COMMENT-mysql =		collectd mysql plugin
COMMENT-pgsql =		collectd postgresql plugin
COMMENT-rrdtool =	collectd rrdtool plugin
COMMENT-snmp =		collectd snmp plugin
COMMENT-virt =		collectd libvirt plugin
COMMENT-python =	collectd python plugin
COMMENT-memcachec =	collectd memcachec plugin
COMMENT-mqtt =		collectd mqtt plugin
COMMENT-nut =		collectd nut plugin
COMMENT-riemann =	collectd riemann plugin
COMMENT-redis =		collectd redis plugin
COMMENT-prometheus =	collectd prometheus plugin
COMMENT-ping =		collectd ping plugin

V =			5.12.0
DISTNAME =		collectd-$V
PKGNAME-main =		collectd-$V
PKGNAME-mysql =		collectd-mysql-$V
PKGNAME-pgsql =		collectd-pgsql-$V
PKGNAME-rrdtool =	collectd-rrdtool-$V
PKGNAME-snmp =		collectd-snmp-$V
PKGNAME-virt =		collectd-virt-$V
PKGNAME-python =	collectd-python-$V
PKGNAME-memcachec =	collectd-memcachec-$V
PKGNAME-mqtt =		collectd-mqtt-$V
PKGNAME-nut =		collectd-nut-$V
PKGNAME-riemann =	collectd-riemann-$V
PKGNAME-redis =		collectd-redis-$V
PKGNAME-prometheus =	collectd-prometheus-$V
PKGNAME-ping =		collectd-ping-$V
CATEGORIES =		sysutils
REVISION =		4
REVISION-nut =		5

HOMEPAGE =		http://www.collectd.org/
SHARED_LIBS +=		collectdclient 1.0

# GPLv2
PERMIT_PACKAGE =	Yes

SITES =			${HOMEPAGE}/files/
EXTRACT_SUFX =		.tar.bz2

MODULES =		lang/python
MODPY_RUNDEP =		No

MULTI_PACKAGES =	-main -mysql -pgsql -rrdtool -snmp -virt -python \
			-memcachec -mqtt -nut -riemann -redis -prometheus -ping

WANTLIB-mysql =		mariadb pthread
LIB_DEPENDS-mysql =	databases/mariadb
RUN_DEPENDS-mysql =	collectd-$V:${BASE_PKGPATH},-main

WANTLIB-pgsql =		pq pthread
LIB_DEPENDS-pgsql =	databases/postgresql
RUN_DEPENDS-pgsql =	collectd-$V:${BASE_PKGPATH},-main

WANTLIB-rrdtool =	X11 cairo expat \
			freetype glib-2.0 gobject-2.0 \
			harfbuzz iconv intl lzma m \
			pango-1.0 pangocairo-1.0 \
			png pthread rrd xcb \
			xml2 z
LIB_DEPENDS-rrdtool =	net/rrdtool
RUN_DEPENDS-rrdtool =	collectd-$V:${BASE_PKGPATH},-main

LIB_DEPENDS-snmp =	net/net-snmp
WANTLIB-snmp =		crypto netsnmp pthread c kvm m netsnmpagent perl ssl
RUN_DEPENDS-snmp =	collectd-$V:${BASE_PKGPATH},-main

LIB_DEPENDS-virt =	sysutils/libvirt
WANTLIB-virt =		iconv lzma m pthread virt xml2 z
RUN_DEPENDS-virt =	collectd-$V:${BASE_PKGPATH},-main

LIB_DEPENDS-python =	${MODPY_LIB_DEPENDS}
WANTLIB-python =	${MODPY_WANTLIB} pthread m util iconv intl
RUN_DEPENDS-python =	collectd-$V:${BASE_PKGPATH},-main \
			${MODPY_RUN_DEPENDS}

LIB_DEPENDS-memcachec =	devel/libmemcached
WANTLIB-memcachec =	crypto m memcached sasl2 pthread
RUN_DEPENDS-memcachec =	collectd-$V:${BASE_PKGPATH},-main

LIB_DEPENDS-nut =	nut->=2.7.3p0:sysutils/nut
RUN_DEPENDS-nut =	collectd-$V:${BASE_PKGPATH},-main
WANTLIB-nut =		crypto kvm pthread ssl upsclient

LIB_DEPENDS-riemann =	sysutils/riemann-c-client
WANTLIB-riemann =	gmp gnutls hogweed intl iconv idn2 nettle \
			protobuf-c p11-kit pthread riemann-client-gnutls tasn1 \
			unistring brotlidec brotlienc z zstd
RUN_DEPENDS-riemann =	collectd-$V:${BASE_PKGPATH},-main

LIB_DEPENDS-mqtt =	net/mosquitto
RUN_DEPENDS-mqtt =	collectd-$V:${BASE_PKGPATH},-main
WANTLIB-mqtt =		mosquitto pthread

LIB_DEPENDS-prometheus =	www/libmicrohttpd \
				devel/protobuf-c
RUN_DEPENDS-prometheus =	collectd-$V:${BASE_PKGPATH},-main
WANTLIB-prometheus =	gmp gnutls hogweed iconv idn2 intl microhttpd \
			nettle p11-kit protobuf-c pthread tasn1 unistring \
			brotlidec brotlienc z zstd

LIB_DEPENDS-redis =	databases/libhiredis
RUN_DEPENDS-redis =	collectd-$V:${BASE_PKGPATH},-main
WANTLIB-redis =		hiredis pthread

LIB_DEPENDS-ping =	net/liboping
RUN_DEPENDS-ping =	collectd-$V:${BASE_PKGPATH},-main
WANTLIB-ping =		m oping pthread

LIB_DEPENDS +=	net/curl \
		textproc/libxml \
		sysutils/libstatgrab \
		security/libgcrypt \
		devel/libyajl

WANTLIB += c crypto gpg-error kvm curl xml2 lzma m
WANTLIB += nghttp2 nghttp3 ngtcp2 ngtcp2_crypto_quictls
WANTLIB += pcap pthread ssl xml2 z statgrab gcrypt iconv intl
WANTLIB += yajl

CONFIGURE_STYLE =	autoconf
AUTOCONF_VERSION =	2.69
# uses -export-symbol-regex
USE_LIBTOOL=		gnu
LIBTOOL_FLAGS =	--tag=disable-static
CONFIGURE_ARGS +=--with-librrd=${LOCALBASE} \
		--with-libstatgrab=${LOCALBASE} \
		--with-libnetsnmp=${LOCALBASE} \
		--enable-all-plugins=no \
		--disable-werror

# no, varnishapi.h not in our varnish package
#		--with-libvarnish=${LOCALBASE}

ENABLED_PLUGINS =	apache apcups ascent bind cpu csv curl curl_xml \
			df disk dns email exec filecount interface load \
			logfile match_empty_counter match_hashed match_regex \
			match_timediff match_value memcached memory mysql \
			network nginx ntpd olsrd openvpn ping postgresql powerdns \
			processes redis rrdtool rrdcached snmp snmp_agent swap syslog table tail tail_csv \
			target_notification target_replace target_scale \
			target_set target_v5upgrade tcpconns teamspeak2 ted unixsock uptime \
			users uuid write_http write_graphite pf python virt memcachec nut \
			aggregation curl_json log_logstash memcached mqtt \
			threshold write_log write_prometheus write_redis write_riemann write_tsdb

.for _plugin in ${ENABLED_PLUGINS}
CONFIGURE_ARGS += --enable-${_plugin}
.endfor

CONFIGURE_ENV +=	PYTHON_CONFIG='${LOCALBASE}/bin/python${MODPY_VERSION}-config' \
			CPPFLAGS='-I${LOCALBASE}/include -I${MODPY_INCDIR}/cpython' \
			LDFLAGS='-L${LOCALBASE}/lib -L${X11BASE}/lib -pthread'

post-install:
	rm -f ${PREFIX}/lib/collectd/*.la

.include <bsd.port.mk>
