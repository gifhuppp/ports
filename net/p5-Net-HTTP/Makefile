COMMENT =	Perl HTTP connection client

DISTNAME =	Net-HTTP-6.23

CATEGORIES =	net

MAINTAINER =		Alexander Bluhm <bluhm@openbsd.org>

# Perl
PERMIT_PACKAGE =	Yes

MODULES =		cpan

RUN_DEPENDS =		www/p5-URI

.ifdef LIVE_TEST
TEST_DEPENDS =		security/p5-IO-Socket-SSL>=2.012 \
			net/p5-IO-Socket-INET6
.else
TEST_ENV =		NO_NETWORK_TESTING=1
.endif

PKG_ARCH =		*

.include <bsd.port.mk>
