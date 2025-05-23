COMMENT=	latency logging and graphing system

V=		2.9.0
DISTNAME=	smokeping-$V
REVISION=	0

CATEGORIES=	net

SITES=		${HOMEPAGE}pub/

HOMEPAGE=	https://oss.oetiker.ch/smokeping/

# GPLv2+
PERMIT_PACKAGE=	Yes

COMMON_DEPENDS=	devel/p5-Config-Grammar \
		net/p5-SNMP_Session \
		net/p5-Socket6 \
		net/rrdtool \
		security/p5-Digest-HMAC \
		www/fcgi \
		www/p5-CGI \
		www/p5-CGI-Fast \
		www/p5-LWP-Protocol-https \
		www/p5-libwww
RUN_DEPENDS=	${COMMON_DEPENDS} \
		net/fping \
		www/spawn-fcgi
BUILD_DEPENDS=	${COMMON_DEPENDS}

SYSCONFDIR=	${BASESYSCONFDIR}/smokeping

NO_TEST=	Yes
USE_GMAKE=	Yes
PKG_ARCH=	*

AUTOCONF_VERSION= 2.71
AUTOMAKE_VERSION= 1.16
CONFIGURE_STYLE= autoreconf
CONFIGURE_ENV=	PERL5LIB=${LOCALBASE}/libdata/perl5/site_perl
CONFIGURE_ARGS=	--enable-pkgonly \
		--with-htdocs-dir=/var/www/htdocs/smokeping
FAKE_FLAGS=	sysconfdir=${PREFIX}/share/examples/smokeping

PMDIR=		libdata/perl5/site_perl
SUBST_VARS=	PMDIR

MODULES=	perl
MODPERL_ADJ_FILES= bin/smokeinfo bin/smokeping bin/smokeping_cgi bin/tSmoke

post-extract:
	[ -r ${WRKSRC}/VERSION ] || echo $V > ${WRKSRC}/VERSION

pre-configure:
	@cd ${WRKSRC} && ${SUBST_CMD} \
	    etc/config.dist.in bin/smokeping bin/smokeping_cgi bin/tSmoke
	perl -pi -e s,/usr/local,${LOCALBASE}, ${WRKSRC}/lib/Smokeping/probes/*.pm

post-install:
	-mv ${PREFIX}/share/examples/smokeping/examples/* \
	    ${PREFIX}/share/examples/smokeping; \
	    rmdir ${PREFIX}/share/examples/smokeping/examples
	rm -f ${WRKINST}/var/www/htdocs/smokeping/smokeping.fcgi.dist
	printf "#!/bin/sh\nexec ${LOCALBASE}/bin/smokeping_cgi ${SYSCONFDIR}/config\n" > \
	    ${WRKINST}/var/www/htdocs/smokeping/smokeping.fcgi
	chmod +x ${WRKINST}/var/www/htdocs/smokeping/smokeping.fcgi
	chown -R ${SHAREOWN}:${SHAREGRP} ${WRKINST}/var/www
	${INSTALL_DATA} ${FILESDIR}/httpd.conf \
	    ${PREFIX}/share/examples/smokeping/httpd.conf

.include <bsd.port.mk>
