COMMENT =		collection of tools for translating from BibTeX to HTML

DISTNAME =		bibtex2html-1.99
REVISION =		8

CATEGORIES =		textproc
HOMEPAGE =		https://www.lri.fr/~filliatr/bibtex2html/

# GPLv2 only
PERMIT_PACKAGE =	Yes

WANTLIB =  c m pthread

SITES =			https://www.lri.fr/~filliatr/ftp/bibtex2html/

BUILD_DEPENDS =		lang/ocaml \
			print/texlive/base \
			textproc/hevea
RUN_DEPENDS =		print/texlive/base

FAKE_FLAGS =		DOCDIR="${DESTDIR}${PREFIX}/share/doc/bibtex2html"

USE_GMAKE =		Yes
CONFIGURE_STYLE =	gnu dest

INSTALL_TARGET =	install install-doc
TEST_TARGET =		test

.include <bsd.port.mk>
