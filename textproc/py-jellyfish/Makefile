COMMENT =		Python library for approximate and phonetic string matching

MODPY_DISTV =	1.1.0
REVISION =		1
DISTNAME =		jellyfish-${MODPY_DISTV}
PKGNAME =		py-${DISTNAME:S/_/-/g}

CATEGORIES =		textproc

HOMEPAGE =		https://jamesturk.github.io/jellyfish/

MAINTAINER =		Daniel Dickman <daniel@openbsd.org>

# MIT
PERMIT_PACKAGE =	Yes

WANTLIB += ${MODCARGO_WANTLIB}

MODULES =		devel/cargo \
			lang/python

MODPY_PI =		Yes
MODPY_PYBUILD =		maturin

MODCARGO_CARGO_BIN =	maturin
CONFIGURE_STYLE =	cargo

BUILD_DEPENDS =		devel/maturin \
			devel/py-pip

do-build:
	${MODCARGO_CARGO_RUN} build \
		--manifest-path ${MODCARGO_CARGOTOML} \
		--release \
		${MODCARGO_BUILD_ARGS}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/target/release/libjellyfish.so ${PREFIX}/lib
	pip${MODPY_VERSION} install --no-cache-dir --isolated \
		--root=${WRKINST} \
		--ignore-installed \
		--no-deps ${WRKSRC}/target/wheels/*.whl

do-test:
	pip${MODPY_VERSION} install --no-cache-dir --isolated \
		--target=${WRKSRC}/tests \
		--ignore-installed \
		--no-deps ${WRKSRC}/target/wheels/*.whl
	cd ${WRKSRC} && ${SETENV} ${ALL_TEST_ENV} ${MODPY_BIN} -m pytest -v

.include "crates.inc"

.include <bsd.port.mk>
