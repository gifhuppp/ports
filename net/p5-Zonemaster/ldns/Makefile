COMMENT=	module to interface the DNS resolver using the ldns library

MODULES=	cpan
CPAN_AUTHOR=	ZNMSTR
DISTNAME=	Zonemaster-LDNS-5.0.0
CATEGORIES=	net

MAINTAINER=	Stuart Henderson <stu.ports@spacehopper.org>

# BSD
PERMIT_PACKAGE= Yes

WANTLIB += c crypto idn2 ldns perl

BUILD_DEPENDS=	devel/p5-Devel-CheckLib \
		devel/p5-ExtUtils-PkgConfig

# * `Module::Install`
# * `Module::Install::XSUtil`

LIB_DEPENDS=	devel/libidn2 \
		net/ldns
TEST_DEPENDS=	devel/p5-Test-Fatal

# --no-ed25519: requires openssl 1.1.1 for NID_ED25519 etc.
# --prefix-openssl: actually used for -lldns -lidn2 not openssl
CONFIGURE_ARGS=	--no-internal-ldns \
		--no-ed25519 \
		--prefix-openssl=${LOCALBASE}

.include <bsd.port.mk>
