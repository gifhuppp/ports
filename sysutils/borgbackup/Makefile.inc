COMMENT =		deduplicating backup program

DISTNAME =		borgbackup-${MODPY_DISTV}

CATEGORIES =		sysutils

HOMEPAGE =		https://www.borgbackup.org/

MAINTAINER =		Bjorn Ketelaars <bket@openbsd.org>

# BSD-3
PERMIT_PACKAGE =	Yes

WANTLIB +=		lz4 xxhash zstd

COMPILER =		base-clang ports-gcc
COMPILER_LANGS =	c

MODULES =		lang/python
MODPY_PYBUILD =		setuptools_scm
MODPY_PI =		Yes
MODPY_PYTEST_ARGS =	build/lib.openbsd-${OSREV}-${ARCH}-cpython-${MODPY_MAJORMINOR}

LIB_DEPENDS +=		archivers/lz4 \
			archivers/zstd \
			sysutils/xxhash
BUILD_DEPENDS +=	devel/py-pkgconfig \
			lang/cython
RUN_DEPENDS +=		net/py-msgpack \
			sysutils/py-packaging
TEST_DEPENDS +=		${FULLPKGNAME}:${FULLPKGPATH} \
			devel/py-test-benchmark

PORTHOME =		${WRKDIR}

post-install:
	${INSTALL_MAN} ${WRKSRC}/docs/man/*.1 ${PREFIX}/man/man1/

	${INSTALL_DATA_DIR} ${PREFIX}/share/bash-completion/completions/
	${INSTALL_DATA} ${WRKSRC}/scripts/shell_completions/bash/borg \
		${PREFIX}/share/bash-completion/completions/

	${INSTALL_DATA_DIR} ${PREFIX}/share/fish/vendor_completions.d/
	${INSTALL_DATA} ${WRKSRC}/scripts/shell_completions/fish/borg.fish \
		${PREFIX}/share/fish/vendor_completions.d/

	${INSTALL_DATA_DIR} ${PREFIX}/share/zsh/site-functions/
	${INSTALL_DATA} ${WRKSRC}/scripts/shell_completions/zsh/_borg \
		${PREFIX}/share/zsh/site-functions/
