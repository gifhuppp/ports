COMMENT-main=		interactive spelling checker
COMMENT-dutch=		ispell dictionary for Dutch
COMMENT-french=		ispell dictionary for French
COMMENT-german=		ispell dictionary for German
COMMENT-russian=	ispell dictionary for Russian
COMMENT-portuguese=	ispell dictionary for Portuguese
COMMENT-slovak=		ispell dictionary for Slovak
COMMENT-spanish=	ispell dictionary for Spanish
COMMENT-swedish=	ispell dictionary for Swedish

VERSION=	3.4.06
DISTNAME=	ispell-${VERSION}

CATEGORIES=	textproc

HOMEPAGE=	https://www.cs.hmc.edu/~geoff/ispell.html

SITES=		https://www.cs.hmc.edu/~geoff/tars/
SITES.a=	http://distcache.freebsd.org/ports-distfiles/
SITES.b=	https://spacehopper.org/mirrors/
SITES.c=	ftp://ftp.informatik.uni-kiel.de/pub/kiel/dicts/
SITES.d=	http://www.sslug.dk/locale/ispell/iswedish/
SITES.e=	http://natura.di.uminho.pt/download/sources/Dictionaries/ispell/
SITES.f=	http://sk-spell.sk.cx/files/
SITES.g=	http://www.datsi.fi.upm.es/~coes/

DIST_SUBDIR=	ispell

DUTCH_DICT=		ispell-nl-1.0.0
FRENCH_DICT=		francais-IREQ-1.4
GERMAN_DICT=		hk2-deutsch
SWEDISH_DICT=		iswedish-1.2.1
RUSSIAN_DICT=		rus-ispell-0.99e7
PORTUGUESE_DICT=	ispell.pt-20091013
SLOVAK_DICT=		ispell-sk-0.3.2
SPANISH_DICT=		espa~nol-1.7

DISTFILES=	${DISTNAME}.tar.gz
DISTFILES.a+= 	${DUTCH_DICT}.tar.gz
DISTFILES.b+= 	${FRENCH_DICT}.tar.gz
DISTFILES.c+= 	${GERMAN_DICT}.tar.gz
DISTFILES.d+= 	${SWEDISH_DICT}.tar.gz
DISTFILES.b+= 	${RUSSIAN_DICT}.tar.gz
DISTFILES.e+= 	${PORTUGUESE_DICT}.tar.gz
DISTFILES.f+= 	${SLOVAK_DICT}.tar.gz
DISTFILES.g+= 	${SPANISH_DICT}.tar.gz

EXTRACT_ONLY=	${DISTNAME}.tar.gz \
		${DUTCH_DICT}.tar.gz \
		${SWEDISH_DICT}.tar.gz \
		${PORTUGUESE_DICT}.tar.gz \
		${SLOVAK_DICT}.tar.gz  \
		${SPANISH_DICT}.tar.gz

SUBST_VARS+=	VERSION

MULTI_PACKAGES=	-main -dutch -french -german -swedish -russian -portuguese \
		-slovak -spanish

PKGNAME-main =	${DISTNAME}
.for s in ${MULTI_PACKAGES}
PKGNAME${s} ?= ${PKGNAME}$s
.endfor

# ispell: BSD-like
# dictionaries: GPL or BSD-like
PERMIT_PACKAGE=	Yes
PERMIT_PACKAGE-german=	no license

WANTLIB-main=		c curses

RUN_DEPENDS=	textproc/ispell
RUN_DEPENDS-main=

MAKE_FLAGS=	TMPDIR=${WRKDIR}

NO_TEST=	Yes

post-extract:
	@mkdir -p ${WRKDIR}/french
	@(cd ${WRKDIR}/french; \
	tar xzf ${FULLDISTDIR}/${FRENCH_DICT}${EXTRACT_SUFX})

	@mkdir -p ${WRKDIR}/german
	@(cd ${WRKDIR}/german; \
	tar xzf ${FULLDISTDIR}/${GERMAN_DICT}${EXTRACT_SUFX})

	@mkdir -p ${WRKDIR}/russian
	@(cd ${WRKDIR}/russian; \
	tar xzf ${FULLDISTDIR}/${RUSSIAN_DICT}${EXTRACT_SUFX})

	@(cd ${WRKDIR}/${SPANISH_DICT}/; \
	mv espa~nol.aff spanish.aff; \
	mv espa~nol.words+ spanish.words+)

pre-configure:
	@sed "s%/usr/local%${PREFIX}%g" ${WRKSRC}/local.h.bsd > \
		${WRKSRC}/local.h
	@echo "#define CFLAGS \"${CFLAGS}\"" >> ${WRKSRC}/local.h
	@echo "#define CC \"${CC}\"" >> ${WRKSRC}/local.h

post-build:
	@sed "s%/usr/local%${PREFIX}%g" ${FILESDIR}/ispell-config > \
		${WRKDIST}/ispell-config

	@(cd ${WRKDIR}/${DUTCH_DICT}; \
	${WRKDIST}/buildhash words-nl.ispell nederlands.aff nederlands.hash)

	@(cd ${WRKDIR}/french; \
	$(MAKE) RM='rm -f' HASH=${WRKDIST}/buildhash)

	@(cd ${WRKDIR}/german; \
	sort -u *.txt | ./tex2iso >all.words; \
	${WRKDIST}/buildhash all.words deutsch.aff deutsch.hash)

	@(cd ${WRKDIR}/${SWEDISH_DICT}; \
	${WRKDIST}/buildhash svenska.datalista svenska.aff svenska.hash)

	@(cd ${WRKDIR}/russian; \
	sort -u base.koi computer.koi geography.koi science.koi >all.words; \
	sed -e "s/^\#y//;s/^\#koi/wordchars/" < russian.aff.koi > russian.aff; \
	${WRKDIST}/buildhash all.words russian.aff russian.hash)

	@(cd ${WRKDIR}/${PORTUGUESE_DICT}; \
	${WRKDIST}/buildhash portugues.dic portugues.aff portuguese.hash; \
	cp portugues.aff portuguese.aff)

	@(cd ${WRKDIR}/${SLOVAK_DICT}; \
	${WRKDIST}/buildhash slovak.words slovak.aff slovak.hash)

	@(cd ${WRKDIR}/${SPANISH_DICT}; \
	${WRKDIST}/buildhash spanish.words+ spanish.aff spanish.hash)

do-install:
	${INSTALL_PROGRAM} ${WRKDIST}/ispell ${PREFIX}/bin/ispell
	${INSTALL_PROGRAM} ${WRKDIST}/buildhash ${PREFIX}/bin/buildhash
	${INSTALL_PROGRAM} ${WRKDIST}/tryaffix ${PREFIX}/bin/tryaffix
	${INSTALL_PROGRAM} ${WRKDIST}/ijoin ${PREFIX}/bin/ijoin
	${INSTALL_PROGRAM} ${WRKDIST}/findaffix ${PREFIX}/bin/findaffix
	${INSTALL_PROGRAM} ${WRKDIST}/munchlist ${PREFIX}/bin/munchlist
	${INSTALL_PROGRAM} ${WRKDIST}/icombine ${PREFIX}/bin/icombine
	${INSTALL_SCRIPT} ${WRKDIST}/ispell-config ${PREFIX}/bin/ispell-config

	${INSTALL_MAN} ${WRKDIST}/ispell.1 ${PREFIX}/man/man1/
	ln -fs ispell.1 ${PREFIX}/man/man1/buildhash.1
	ln -fs ispell.1 ${PREFIX}/man/man1/munchlist.1
	ln -fs ispell.1 ${PREFIX}/man/man1/findaffix.1
	ln -fs ispell.1 ${PREFIX}/man/man1/tryaffix.1
	${INSTALL_MAN} ${WRKDIST}/ispell.5 ${PREFIX}/man/man5/
	ln -fs ispell.5 ${PREFIX}/man/man5/english.5

	${INSTALL_DATA_DIR} ${PREFIX}/lib/ispell

	${INSTALL_DATA} ${WRKDIST}/languages/english/english.aff \
		${PREFIX}/lib/ispell/american.aff
	ln -fs american.aff ${PREFIX}/lib/ispell/british.aff
	${INSTALL_DATA} ${WRKDIST}/languages/american/americanmed+.hash \
		${PREFIX}/lib/ispell/americanmed+.hash
	ln -fs americanmed+.hash ${PREFIX}/lib/ispell/american.hash
	${INSTALL_DATA} ${WRKDIST}/languages/british/britishxlg.hash \
		${PREFIX}/lib/ispell/britishxlg.hash
	ln -fs britishxlg.hash ${PREFIX}/lib/ispell/british.hash

	${INSTALL_DATA} ${WRKDIR}/${DUTCH_DICT}/nederlands.{aff,hash} \
		${PREFIX}/lib/ispell
	${INSTALL_DATA} ${WRKDIR}/german/deutsch.{aff,hash} \
		${PREFIX}/lib/ispell
	${INSTALL_DATA} ${WRKDIR}/french/francais.{aff,hash} \
		${PREFIX}/lib/ispell
	${INSTALL_DATA} ${WRKDIR}/${SWEDISH_DICT}/svenska.{aff,hash} \
		${PREFIX}/lib/ispell
	${INSTALL_DATA} ${WRKDIR}/russian/russian.{aff,hash} \
		${PREFIX}/lib/ispell
	${INSTALL_DATA} ${WRKDIR}/${PORTUGUESE_DICT}/portuguese.{aff,hash} \
		${PREFIX}/lib/ispell
	${INSTALL_DATA} ${WRKDIR}/${SLOVAK_DICT}/slovak.{aff,hash} \
		${PREFIX}/lib/ispell
	${INSTALL_DATA} ${WRKDIR}/${SPANISH_DICT}/spanish.{aff,hash} \
		${PREFIX}/lib/ispell

.include <bsd.port.mk>
