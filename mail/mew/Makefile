COMMENT=	emacs-based mail client

DISTNAME=	mew-6.10
CATEGORIES=	mail
HOMEPAGE=	http://www.mew.org/

MAINTAINER=	YASUOKA Masahiko <yasuoka@yasuoka.net>

# BSD license
PERMIT_PACKAGE=	Yes

WANTLIB=		c z

SITES=			http://www.mew.org/Release/

MODULES=		lang/ruby
MODRUBY_BUILDDEP=	No
MODRUBY_ADJ_FILES=	cmew smew

BUILD_DEPENDS=		emacs->=24:editors/emacs
RUN_DEPENDS=		emacs->=24:editors/emacs \
			security/stunnel \
			databases/ruby-sqlite3,${MODRUBY_FLAVOR}

CONFIGURE_STYLE=	simple
CONFIGURE_ARGS+=	elispdir=${PREFIX}/share/emacs/site-lisp \
			etcdir=${PREFIX}/share/emacs/site-lisp/etc \
			infodir=${PREFIX}/info \
			mandir=${PREFIX}/man

NO_TEST=		Yes

MEWDOCFILES=		*.md
MEWCHANGES=		CHANGES/*.md
MEWDOTFILES=		conf/dot.*

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/mew
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/mew/CHANGES
	cd ${WRKSRC}; ${INSTALL_DATA} ${MEWDOCFILES} ${PREFIX}/share/doc/mew
	cd ${WRKSRC}; ${INSTALL_DATA} ${MEWDOTFILES} ${PREFIX}/share/doc/mew
	cd ${WRKSRC}; ${INSTALL_DATA} ${MEWCHANGES} ${PREFIX}/share/doc/mew/CHANGES

.include <bsd.port.mk>
