MULTI_PACKAGES=	-main -drill -utils

COMMENT-main=	DNS library modelled after Net::DNS
COMMENT-drill=	DNS debugger
COMMENT-utils=	LDNS utilities

V=		1.8.4
DISTNAME=	ldns-$V
PKGNAME-main=	libldns-$V
PKGNAME-drill=	drill-$V

SHARED_LIBS +=	ldns                 9.0      # 9.0

CATEGORIES=	net

SITES=		https://www.nlnetlabs.nl/downloads/ldns/
HOMEPAGE=	https://www.nlnetlabs.nl/projects/ldns/

# BSD
PERMIT_PACKAGE=	Yes

# ssl included as ssl.h has been used.
WANTLIB-main=	crypto ssl
WANTLIB-drill=	c crypto ldns
WANTLIB-utils=	c crypto ldns pcap ssl

LIB_DEPENDS=	${FULLPKGPATH-main}=$V
LIB_DEPENDS-main=	# empty

USE_GMAKE=	Yes

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS=		--with-drill \
			--with-examples \
			--disable-gost \
			--disable-ldns-config \
			--with-trust-anchor=/var/unbound/db/root.key \
			--with-ca-file=/etc/ssl/cert.pem

# "OpenSSL does not support offline DANE verification (Needed for the
# DANE-TA usage type). Please upgrade OpenSSL to version >= 1.1.0 or rerun
# with --disable-dane-verify or --disable-dane-ta-usage"
CONFIGURE_ARGS+=	--disable-dane-ta-usage

CONFIGURE_ENV+=		ac_cv_prog_doxygen= \
			ac_cv_header_openssl_engine_h= \
			CPPFLAGS=-DOPENSSL_NO_ENGINE

NO_TEST=		Yes

.include <bsd.port.mk>
