COMMENT-main= 	canna (kana-kanji converter) libraries
COMMENT-dict=	canna (kana-kanji converter) dictionaries
COMMENT-server=	canna (kana-kanji converter) server

DISTNAME=	Canna35b2

PKGNAME-main=	cannalib-3.5b2
PKGNAME-dict=	cannadict-3.5b2
PKGNAME-server=	cannaserver-3.5b2

REVISION-main =	6
REVISION-dict =	1
REVISION-server = 8

SHARED_LIBS=	RKC	1.0 \
		RKC16	1.0 \
		canna	1.0 \
		canna16	1.0

CATEGORIES=	japanese

SITES =		ftp://ftp.sra.co.jp/pub/misc/canna/

SITES.p=	http://www.jaist.ac.jp/~fujieda/canna/
PATCHFILES.p=	Canna35b2-unoff1.patch.gz Canna35b2-unoff2.patch.gz \
		Canna35b2-hack1.patch.gz
PATCH_DIST_STRIP=	-p1

MAINTAINER=	Marc Espie <espie@openbsd.org>

HOMEPAGE =	http://www.nec.co.jp/canna/

PERMIT_PACKAGE=	Yes

MULTI_PACKAGES=-main -dict -server

CFLAGS_base-clang =	-Wno-error=int-conversion

BUILD_DEPENDS=		japanese/nkf

PREFIX-dict=		${VARBASE}/dict
LIB_DEPENDS-server=	japanese/canna
WANTLIB-server=	c canna

SUBST_VARS=	DICT_DIR
CONFIGURE_STYLE=imake
CANNAOWNER=	daemon
CANNAGROUP=	daemon
DICT_DIR=	${VARBASE}/dict/canna
DIFF_ARGS=	-U 2

MAKE_ENV+=      CANNAOWNER=${CANNAOWNER} CANNAGROUP=${CANNAGROUP} \
		DICT_DIR=${DICT_DIR} CANNA_SPOOL=${VARBASE}/spool/canna

MAKE_FLAGS=	LIBRKC_VERSION=$(LIBRKC_VERSION) \
		LIBRKC16_VERSION=$(LIBRKC16_VERSION) \
		LIBcanna_VERSION=$(LIBcanna_VERSION) \
		LIBcanna16_VERSION=$(LIBcanna16_VERSION) \
		COPTS="${COPTS} ${CFLAGS}"

NO_TEST=	Yes

.include <bsd.port.mk>
