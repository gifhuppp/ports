COMMENT =		obtain expiration date of SSL certificate

DISTNAME =		Net-SSL-ExpireDate-1.25
CATEGORIES =		security

# Perl
PERMIT_PACKAGE =	Yes

MODULES =		cpan
PKG_ARCH =		*
RUN_DEPENDS =		devel/p5-Time-Duration-Parse \
			security/p5-Crypt-OpenSSL-X509 \
			devel/p5-Universal-require \
			devel/p5-DateTime \
			devel/p5-Time-TimeDate \
			devel/p5-Class-Accessor
TEST_DEPENDS =		${RUN_DEPENDS} \
			devel/p5-Test-Base

CONFIGURE_STYLE =	modbuild tiny

.include <bsd.port.mk>
