COMMENT =	enable all of the features of Modern Perl with one import

CPAN_AUTHOR =	CHROMATIC
DISTNAME =	Modern-Perl-1.20250607

CATEGORIES =	devel

# Perl
PERMIT_PACKAGE =	Yes

MODULES =		cpan

PKG_ARCH =		*

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/p5-Modern-Perl
	${INSTALL_DATA} \
		${WRKSRC}/{README,Changes,LICENSE} ${PREFIX}/share/doc/p5-Modern-Perl

.include <bsd.port.mk>
