COMMENT =		command-line interface for the hledger accounting system

CATEGORIES =		productivity

HOMEPAGE =		https://hledger.org

# GPLv3
PERMIT_PACKAGE =	Yes

WANTLIB =		c curses ffi gmp iconv m pthread util

LIB_DEPENDS =		converters/libiconv \
			devel/gmp \
			devel/libffi

MODULES =		devel/cabal
MODCABAL_STEM =		hledger
MODCABAL_VERSION =	1.40

post-install:
	@${INSTALL_MAN} ${WRKSRC}/embeddedfiles/hledger.1 ${PREFIX}/man/man1

MODCABAL_MANIFEST	= \
	Decimal	0.5.2	0	\
	Diff	0.5	1	\
	Glob	0.10.2	3	\
	OneTuple	0.4.2	0	\
	Only	0.1	2	\
	QuickCheck	2.15.0.1	0	\
	StateVar	1.2.2	0	\
	aeson	2.2.3.0	2	\
	aeson-pretty	0.8.10	0	\
	ansi-terminal	1.1.1	0	\
	ansi-terminal-types	1.1	0	\
	assoc	1.1.1	0	\
	async	2.2.5	2	\
	attoparsec	0.14.4	5	\
	base-compat	0.14.0	0	\
	base-orphans	0.9.2	0	\
	bifunctors	5.6.2	0	\
	bitvec	1.1.5.0	1	\
	blaze-builder	0.4.2.3	0	\
	blaze-html	0.9.2.0	1	\
	blaze-markup	0.8.3.0	2	\
	cabal-doctest	1.0.10	0	\
	call-stack	0.4.0	0	\
	case-insensitive	1.2.1.0	0	\
	cassava	0.5.3.2	0	\
	cassava-megaparsec	2.1.1	0	\
	character-ps	0.1	0	\
	clock	0.8.4	0	\
	cmdargs	0.10.22	0	\
	colour	2.3.6	0	\
	comonad	5.0.8	2	\
	conduit	1.3.6	0	\
	conduit-extra	1.3.6	0	\
	contravariant	1.5.5	0	\
	control-monad-free	0.6.2	0	\
	csv	0.1.2	0	\
	data-default	0.7.1.3	0	\
	data-default-class	0.1.2.2	0	\
	data-default-instances-containers	0.1.0.3	0	\
	data-default-instances-dlist	0.0.1.2	0	\
	data-default-instances-old-locale	0.0.1.2	0	\
	data-fix	0.3.4	0	\
	distributive	0.6.2.1	1	\
	dlist	1.0	2	\
	doclayout	0.5	0	\
	emojis	0.1.4.1	0	\
	extra	1.7.16	0	\
	file-embed	0.0.16.0	0	\
	generically	0.1.1	3	\
	githash	0.1.7.0	0	\
	hashable	1.4.7.0	0	\
	hashtables	1.3.1	0	\
	hledger-lib	1.40	0	\
	hsc2hs	0.68.10	2	\
	html	1.0.1.2	0	\
	indexed-traversable	0.1.4	0	\
	indexed-traversable-instances	0.1.2	0	\
	integer-conversion	0.1.1	0	\
	integer-logarithms	1.0.3.1	6	\
	lucid	2.11.20230408	2	\
	math-functions	0.3.4.4	0	\
	megaparsec	9.6.1	0	\
	microlens	0.4.13.1	1	\
	microlens-th	0.4.3.15	0	\
	mmorph	1.2.0	3	\
	mono-traversable	1.0.20.0	0	\
	network	3.2.4.0	0	\
	network-uri	2.6.4.2	1	\
	old-locale	1.0.0.7	2	\
	optparse-applicative	0.18.1.0	0	\
	os-string	2.0.6	0	\
	pager	0.1.1.0	0	\
	parser-combinators	1.3.0	1	\
	pretty-simple	4.1.2.0	0	\
	prettyprinter	1.7.1	0	\
	prettyprinter-ansi-terminal	1.1.3	0	\
	primitive	0.9.0.0	1	\
	quote-quot	0.2.1.0	0	\
	random	1.2.1.2	0	\
	regex-base	0.94.0.2	4	\
	regex-tdfa	1.3.2.2	3	\
	resourcet	1.3.0	0	\
	safe	0.3.21	1	\
	scientific	0.3.8.0	1	\
	semialign	1.3.1	1	\
	semigroupoids	6.0.1	1	\
	shakespeare	2.1.0.1	0	\
	split	0.2.5	0	\
	splitmix	0.1.0.5	1	\
	streaming-commons	0.2.2.6	1	\
	strict	0.5.1	1	\
	tabular	0.2.2.8	1	\
	tagged	0.8.8	1	\
	tasty	1.5	2	\
	tasty-hunit	0.10.2	0	\
	temporary	1.3	0	\
	terminal-size	0.3.4	1	\
	text-ansi	0.3.0.1	1	\
	text-builder-linear	0.1.3	0	\
	text-iso8601	0.1.1	1	\
	text-short	0.1.6	2	\
	th-abstraction	0.7.0.0	0	\
	th-compat	0.1.5	2	\
	th-lift	0.8.4	2	\
	these	1.2.1	1	\
	time-compat	1.9.7	2	\
	timeit	2.0	2	\
	transformers-compat	0.7.2	0	\
	typed-process	0.2.12.0	0	\
	uglymemo	0.1.0.1	0	\
	unliftio-core	0.2.1.0	4	\
	unordered-containers	0.2.20	3	\
	utf8-string	1.0.2	0	\
	utility-ht	0.0.17.2	0	\
	uuid-types	1.0.6	1	\
	vector	0.13.1.0	1	\
	vector-algorithms	0.9.0.2	1	\
	vector-stream	0.1.0.1	1	\
	witherable	0.5	1	\
	wizards	1.0.3	3	\
	zlib	0.7.1.0	1	\

.include <bsd.port.mk>
