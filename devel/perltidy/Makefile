COMMENT =	tool to indent and reformat perl scripts

V =		20250711
DISTNAME =	Perl-Tidy-$V
PKGNAME =	perltidy-$V
CATEGORIES =	devel

HOMEPAGE =	https://perltidy.sourceforge.net/

# GPLv2
PERMIT_PACKAGE =	Yes

MODULES =	cpan

PKG_ARCH =	*

DOCS =		tutorial.html stylekey.html

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/perltidy
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/perltidy
.for f in ${DOCS}
	${INSTALL_DATA} ${WRKSRC}/docs/${f} ${PREFIX}/share/doc/perltidy
.endfor
	${INSTALL_DATA} ${WRKSRC}/examples/* ${PREFIX}/share/examples/perltidy

.include <bsd.port.mk>
