COMMENT =	YAML Serialization using XS and libyaml

MODULES =	cpan

V =		0.904.0
DISTNAME =	YAML-LibYAML-v$V
PKGNAME =	p5-YAML-XS-$V
CATEGORIES =	devel

MAINTAINER =	Andrew Hewus Fresh <afresh1@openbsd.org>

# Perl
PERMIT_PACKAGE =		Yes

WANTLIB =	c perl

MODPERL_REGEN_PPPORT =	LibYAML/ppport.h

# To avoid skipping tests
TEST_DEPENDS =	devel/p5-boolean

.include <bsd.port.mk>
