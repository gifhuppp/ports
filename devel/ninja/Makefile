# as error: ``operation combines symbols in different segments''
# (known toolchain problem) - if fixing, re-enable in devel/cmake/Makefile
# and devel/cmake/cmake.port.mk.
NOT_FOR_ARCHS=		m88k

COMMENT =		small build system with a focus on speed

GH_ACCOUNT =		ninja-build
GH_PROJECT =		ninja
GH_TAGNAME =		v1.11.1
# known breakage with 1.12.0: chromium iridium fcitx
REVISION =		0

CATEGORIES =		devel

HOMEPAGE =		https://ninja-build.org/

EPOCH =			0

# Apache License v2.0
PERMIT_PACKAGE =	Yes

WANTLIB =		c m ${COMPILER_LIBCXX}

COMPILER =		base-clang ports-gcc base-gcc

MODULES =		lang/python

MODPY_RUNDEP =		No
MODPY_ADJ_FILES =	configure.py \
			misc/ninja_syntax.py \
			src/browse.py

# Not strictly required, but will be used if available.  Included as a build
# dependency to ensure consistent builds.
BUILD_DEPENDS =		devel/re2c

MAKE_ENV =		CXX="${CXX}"

do-build:
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} \
	${MODPY_BIN} ./configure.py --bootstrap \
	--verbose --with-python=${MODPY_BIN}

do-install:
	${INSTALL_PROGRAM} ${WRKBUILD}/ninja ${PREFIX}/bin
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/ninja
	${INSTALL_DATA} ${WRKSRC}/doc/manual.asciidoc ${PREFIX}/share/doc/ninja
	${INSTALL_DATA_DIR} ${PREFIX}/share/ninja
	${INSTALL_DATA_DIR} ${PREFIX}/share/bash-completion/completions
	${INSTALL_DATA} ${WRKSRC}/misc/bash-completion ${PREFIX}/share/bash-completion/completions/ninja
	${INSTALL_DATA} ${WRKSRC}/misc/ninja-mode.el ${PREFIX}/share/ninja
	${INSTALL_DATA} ${WRKSRC}/misc/ninja.vim ${PREFIX}/share/ninja
	${INSTALL_DATA} ${WRKSRC}/misc/ninja_syntax.py ${PREFIX}/share/ninja
	${INSTALL_DATA} ${WRKSRC}/misc/write_fake_manifests.py ${PREFIX}/share/ninja
	${INSTALL_DATA} ${WRKSRC}/misc/measure.py ${PREFIX}/share/ninja
	${INSTALL_DATA_DIR} ${PREFIX}/share/zsh/site-functions
	${INSTALL_DATA} ${WRKSRC}/misc/zsh-completion ${PREFIX}/share/zsh/site-functions/_ninja

do-test:
	@cd ${WRKSRC} && ${SETENV} ${ALL_TEST_ENV} ./ninja ninja_test \
	&& ./ninja_test --gtest_filter=MyTest.Name

.include <bsd.port.mk>
