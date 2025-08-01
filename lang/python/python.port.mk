#	python.port.mk - This file is in the public domain.
#	Xavier Santolaria <xavier@santolaria.net>
#	Stuart Henderson <stu@spacehopper.org>

CATEGORIES +=		lang/python

# define the default versions
MODPY_DEFAULT_VERSION_2 = 2.7
MODPY_DEFAULT_VERSION_3 = 3.12
MODPY_VERSION ?=	${MODPY_DEFAULT_VERSION_3}

# If switching to a new MODPY_DEFAULT_VERSION_3, say 3.x to 3.y:
# - All ports with PLISTs that depend on the Python version number
# must be REVISION-bumped.
# - Keep xenocara/share/mk/bsd.xorg.mk PYTHON_VERSION in sync.

# verify if MODPY_VERSION found is correct
.if ${MODPY_VERSION} == "2.7"
_MODPY_SUBDIR = 2.7
.elif ${MODPY_VERSION} == "3.12"
_MODPY_SUBDIR = 3
.else
ERRORS += "Fatal: unknown or unsupported MODPY_VERSION: ${MODPY_VERSION}"
.endif

MODPY_WANTLIB =		python${MODPY_VERSION}
MODPY_RUN_DEPENDS =	lang/python/${_MODPY_SUBDIR}
MODPY_LIB_DEPENDS =	lang/python/${_MODPY_SUBDIR}
_MODPY_BUILD_DEPENDS =	lang/python/${_MODPY_SUBDIR}
MODPY_TKINTER_DEPENDS =	lang/python/${_MODPY_SUBDIR},-tkinter

MODPY_MAJOR_VERSION =	${MODPY_VERSION:R}

.if ${MODPY_MAJOR_VERSION} == 2
MODPY_PY_PREFIX =	py-
MODPY_PYCACHE =
MODPY_PYC_MAGIC_TAG =
MODPY_COMMENT =		"@comment "
MODPY_ABI3SO =
MODPY_PYOEXTENSION =	pyo
.elif ${MODPY_MAJOR_VERSION} == 3
# replace py- prefix with py3-
FULLPKGNAME ?=	${PKGNAME:S/^py-/py3-/}${FLAVOR_EXT}
MODPY_PY_PREFIX =	py3-
MODPY_PYCACHE =		__pycache__/
MODPY_MAJORMINOR =	${MODPY_VERSION:C/\.//g}
MODPY_PYC_MAGIC_TAG =	cpython-${MODPY_MAJORMINOR}.
MODPY_COMMENT =
MODPY_ABI3SO =		.abi3
MODPY_PYOEXTENSION ?=	opt-1.pyc
.endif

MODPY_SETUPTOOLS ?=
MODPY_SETUPUTILS ?=
MODPY_PYBUILD ?=	No
MODPY_PI ?=

# If MODPY_PYTEST_ARGS are set, or if using MODPY_PYBUILD, it implies that
# we want MODPY_PYTEST = Yes
MODPY_PYTEST_ARGS ?=
.if empty(MODPY_PYTEST_ARGS) && ${MODPY_PYBUILD:L} == no
MODPY_PYTEST ?=		No
.else
MODPY_PYTEST ?=		Yes
.endif

.if ${MODPY_PYTEST:L} == "yes"
MODPY_TEST_DEPENDS =	${RUN_DEPENDS}
MODPY_TEST_DEPENDS +=	devel/py-test
.else
MODPY_TEST_DEPENDS =	${MODPY_RUN_DEPENDS}
.endif

.if ${NO_BUILD:L} == "no"
MODPY_BUILDDEP ?=	Yes
.else
MODPY_BUILDDEP ?=	No
.endif
MODPY_RUNDEP ?=		Yes
.if ${NO_TEST:L} == "no"
MODPY_TESTDEP ?=	Yes
.else
MODPY_TESTDEP ?=	No
.endif

.if ${MODPY_BUILDDEP:L} == "yes"
BUILD_DEPENDS +=	${_MODPY_BUILD_DEPENDS}
.endif

.if ${MODPY_RUNDEP:L} == "yes"
RUN_DEPENDS +=		${MODPY_RUN_DEPENDS}
.endif

.if ${MODPY_TESTDEP:L} == "yes"
TEST_DEPENDS +=		${MODPY_TEST_DEPENDS}
.endif

_MODPY_PRE_BUILD_STEPS = :

.if ${MODPY_PYBUILD:L} == "no" && ${MODPY_MAJOR_VERSION} != 2
# not necessarily an error, but try to draw attention to it. defer printing
# the warning to fake-install where it's less likely to scroll off the screen.
_MODPY_PRE_BUILD_STEPS += ; if [ -e ${WRKSRC}/pyproject.toml ] && \
	grep -q ^build-backend ${WRKSRC}/pyproject.toml; then \
	    (echo; echo '*** Ports with pyproject.toml should normally use MODPY_PYBUILD'; \
	        grep -H ^build-backend ${WRKSRC}/pyproject.toml; echo ) >> \
	        ${WRKDIR}/.modpy-warn; \
	fi
.endif

_MODPY_USE_CARGO = No

.if ${MODPY_SETUPTOOLS:L} == "yes"
.  if ${MODPY_PYBUILD:L} != "no"
ERRORS += "Fatal: both MODPY_PYBUILD and MODPY_SETUPTOOLS are set. Just use MODPY_PYBUILD."
.  endif
# For Python 2, setuptools provides a package locator that is required at
# runtime for pkg_resources to work, so an RDEP is needed.
# For Python 3, pkg_resources is deprecated - Python core has similar
# functionality in importlib.metadata.
# If a py3 port still needs pkg_resources, expect deprecation warnings
# at runtime, and in that case an RDEP on setuptools should be added
# manually.
.  if ${MODPY_MAJOR_VERSION} == 2
MODPY_SETUPUTILS_DEPEND ?= devel/py2-setuptools
MODPY_RUN_DEPENDS +=	${MODPY_SETUPUTILS_DEPEND}
.  else
MODPY_SETUPUTILS_DEPEND ?= py3-setuptools->=79v0:devel/py-setuptools
.  endif

BUILD_DEPENDS +=	${MODPY_SETUPUTILS_DEPEND}
MODPY_SETUPUTILS =	Yes

# The setuptools uses test target
TEST_TARGET ?=	test
_MODPY_USERBASE =
_MODPY_PRE_BUILD_STEPS += ;${MODPY_CMD} egg_info || true
.elif ${MODPY_PYBUILD:L} != no
BUILD_DEPENDS +=	devel/py-build \
			devel/py-installer
.  if ${MODPY_PYBUILD} == flit
BUILD_DEPENDS +=	devel/py-flit
.  elif ${MODPY_PYBUILD} == flit_core
BUILD_DEPENDS +=	devel/py-flit_core>=3.11.0
.  elif ${MODPY_PYBUILD} == flit_scm
BUILD_DEPENDS +=	devel/py-flit_scm
.  elif ${MODPY_PYBUILD} == hatch-vcs
BUILD_DEPENDS +=	devel/py-hatch-vcs
_MODPY_EXPECTED_BACKEND = hatchling
.  elif ${MODPY_PYBUILD} == hatchling
BUILD_DEPENDS +=	devel/py-hatchling
.  elif ${MODPY_PYBUILD} == jupyter_packaging
BUILD_DEPENDS +=	devel/py-jupyter_packaging
_MODPY_EXPECTED_BACKEND = setuptools
.  elif ${MODPY_PYBUILD} == maturin
BUILD_DEPENDS +=	devel/maturin
MODCARGO_CARGO_BIN =	maturin
_MODPY_WHEELSDIR =	target/wheels
_MODPY_USE_CARGO =	Yes
.  elif ${MODPY_PYBUILD} == mesonpy
BUILD_DEPENDS +=	devel/meson-python
.  elif ${MODPY_PYBUILD} == pbr
BUILD_DEPENDS +=	devel/py-pbr \
			py3-setuptools->=79v0:devel/py-setuptools \
			devel/py-wheel
.  elif ${MODPY_PYBUILD} == pdm
BUILD_DEPENDS +=	devel/py-pdm-backend
.  elif ${MODPY_PYBUILD} == poetry-core
BUILD_DEPENDS +=	devel/py-poetry-core
_MODPY_EXPECTED_BACKEND = poetry.core
.  elif ${MODPY_PYBUILD} == setuptools || \
	${MODPY_PYBUILD} == setuptools_scm || \
	${MODPY_PYBUILD} == setuptools-rust
BUILD_DEPENDS +=	py3-setuptools->=79v0:devel/py-setuptools \
			devel/py-wheel
_MODPY_EXPECTED_BACKEND = setuptools
.    if ${MODPY_PYBUILD} == setuptools_scm
BUILD_DEPENDS +=	devel/py-setuptools_scm
.    elif ${MODPY_PYBUILD} == setuptools-rust
BUILD_DEPENDS +=	devel/py-setuptools-rust
_MODPY_USE_CARGO =	Yes
.    endif
.  elif !${MODPY_PYBUILD:L:Mother}
ERRORS +=		"Fatal: unknown MODPY_PYBUILD value (flit, flit_core, flit_scm, hatch-vcs, hatchling, jupyter_packaging, maturin, mesonpy, other, pbr, pdm, poetry-core, setuptools, setuptools_scm, setuptools-rust)"
.  endif
_MODPY_EXPECTED_BACKEND ?= ${MODPY_PYBUILD}
_MODPY_WHEELSDIR ?= dist
.  if ${_MODPY_USE_CARGO:L} == yes
MODCARGO_INSTALL ?=	No
MODCARGO_TEST ?=	No
MODULES +=		devel/cargo
.  endif
.else
MODPY_SETUPUTILS =	No
# Detect the case where a port is capable of building with setup.py
# via fallback to distutils, but should use py-build instead.
_MODPY_SETUPUTILS_FAKE_DIR =	\
	${WRKDIR}/lib/python${MODPY_VERSION}/site-packages/setuptools
_MODPY_PRE_BUILD_STEPS +=	\
	;mkdir -p ${_MODPY_SETUPUTILS_FAKE_DIR} \
	;exec 3>&1 \
	;exec >${_MODPY_SETUPUTILS_FAKE_DIR}/__init__.py \
	;echo 'def setup(*args, **kwargs):' \
	;echo '    msg = "OpenBSD ports: use MODPY_PYBUILD"' \
	;echo '    raise Exception(msg)' \
	;echo 'Extension = Feature = find_packages = setup' \
	;exec 1>&3
_MODPY_USERBASE =	${WRKDIR}
.endif

.if ${MODPY_SETUPTOOLS:L} == "yes" || ${MODPY_PYBUILD:Msetuptools*}
# Setuptools opportunistically picks up plugins. If it picks one up that
# uses finalize_distribution_options (usually setuptools_scm), junking
# that plugin will cause failure at the end of build.
# In the absence of a targetted means of disabling this, use a big hammer:
DPB_PROPERTIES +=	nojunk
# XXX if a "nojunk" port fails to build, DPB will no longer junk on that
# XXX node, likely resulting in running out of disk space in /usr/local.
.endif

# cython picks up pythran at run time in some cases, resulting in
# DPB failure if junking occurs. Add a dep to avoid this. This is
# conditional to avoid loops (currently seen with py-numpy).
MODPY_CYTHON_PYTHRAN_RDEP ?= Yes
.if defined(BUILD_DEPENDS) && ${BUILD_DEPENDS:Mlang/cython*} && \
	${MODPY_CYTHON_PYTHRAN_RDEP} == Yes
BUILD_DEPENDS +=	lang/pythran
.endif

.if ${MODPY_PI:L} == "yes"
_MODPY_EGG_NAME =	${DISTNAME:S/-${MODPY_DISTV}//}
MODPY_PI_DIR ?=		${DISTNAME:C/^([a-zA-Z0-9]).*/\1/}/${_MODPY_EGG_NAME}
SITES =			${SITE_PYPI:=${MODPY_PI_DIR}/}
HOMEPAGE ?=		https://pypi.python.org/pypi/${_MODPY_EGG_NAME}
.endif

MODPY_BIN =		${LOCALBASE}/bin/python${MODPY_VERSION}
MODPY_INCDIR =		${LOCALBASE}/include/python${MODPY_VERSION}
MODPY_LIBDIR =		${LOCALBASE}/lib/python${MODPY_VERSION}
MODPY_SITEPKG =		${MODPY_LIBDIR}/site-packages

# usually setup.py but Setup.py can be found too
MODPY_SETUP ?=		setup.py

# build or build_ext are commonly used
MODPY_DISTUTILS_BUILD ?=	build --build-base=${WRKBUILD}

.if ${MODPY_SETUPUTILS:L} == "yes"
MODPY_DISTUTILS_INSTALL ?=	install --prefix=${TRUEPREFIX} \
				--root=${DESTDIR} \
				--single-version-externally-managed
.else
MODPY_DISTUTILS_INSTALL ?=	install --prefix=${TRUEPREFIX} \
				--root=${DESTDIR}
.endif

MAKE_ENV +=		CC=${CC} PYTHONUSERBASE=${_MODPY_USERBASE}
CONFIGURE_ENV +=	PYTHON="${MODPY_BIN}"
.if ${CONFIGURE_STYLE:Mgnu}
CONFIGURE_ENV +=	ac_cv_prog_PYTHON="${MODPY_BIN}" \
			ac_cv_path_PYTHON="${MODPY_BIN}"
.endif

_MODPY_RUNBIN =	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MODPY_BIN}

MODPY_CMD =	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} \
			${MODPY_BIN} ./${MODPY_SETUP} \
			${MODPY_SETUP_ARGS}

MODPY_TEST_DIR ?=	${WRKSRC}

MODPY_TEST_CMD = cd ${MODPY_TEST_DIR} && ${SETENV} ${ALL_TEST_ENV} ${MODPY_BIN}
.if ${MODPY_PYTEST:L} == "yes"
MODPY_PYTEST_USERARGS ?=
MODPY_TEST_CMD +=	-m pytest ${MODPY_PYTEST_USERARGS}
MODPY_TEST_LIBDIR ?=	${WRKINST}${MODPY_SITEPKG}:${WRKSRC}/build/lib:${WRKSRC}/build/lib.openbsd-${OSREV}-${ARCH}-cpython-${MODPY_MAJORMINOR}:${WRKSRC}/lib.openbsd-${OSREV}-${ARCH}-${MODPY_VERSION}:${WRKSRC}
TEST_ENV +=		PYTEST_DEBUG_TEMPROOT=${WRKDIR}
.else
MODPY_TEST_CMD +=	./${MODPY_SETUP} ${MODPY_SETUP_ARGS}
.endif

MODPY_TEST_LIBDIR ?=
MODPY_TEST_LOCALE ?=	LC_CTYPE=en_US.UTF-8
TEST_ENV +=		${MODPY_TEST_LOCALE}

.if !empty(MODPY_TEST_LIBDIR)
TEST_ENV +=	PYTHONPATH=${MODPY_TEST_LIBDIR}:lib:src
.endif

SUBST_VARS :=	MODPY_PYCACHE MODPY_COMMENT MODPY_ABI3SO MODPY_PYC_MAGIC_TAG \
		MODPY_BIN MODPY_DISTV MODPY_VERSION \
		MODPY_PY_PREFIX MODPY_PYOEXTENSION ${SUBST_VARS}

UPDATE_PLIST_ARGS += -S MODPY_PYOEXTENSION \
    -I MODPY_ABI3SO -c MODPY_COMMENT -I MODPY_PYCACHE

# set MODPY_BIN for executable scripts
MODPY_BIN_ADJ =	perl -pi \
		-e '$$. == 1 && s|^.*env +python.*$$|\#!${MODPY_BIN}|;' \
		-e '$$. == 1 && s|^.*bin/python.*$$|\#!${MODPY_BIN}|;' \
		-e 'close ARGV if eof;' --

MODPY_ADJ_FILES ?=
.if !empty(MODPY_ADJ_FILES)
MODPYTHON_pre-configure += cd ${WRKSRC} && ${MODPY_BIN_ADJ} ${MODPY_ADJ_FILES}
.endif

.if ${MODPY_VERSION} == ${MODPY_DEFAULT_VERSION_2}
MODPY_COMPILEALL = ${MODPY_BIN} -m compileall
.else
MODPY_COMPILEALL = ${MODPY_BIN} -m compileall -j ${MAKE_JOBS} -s ${WRKINST} -o 0 -o 1
.endif

MODPY_TEST_TARGET =
MODPY_TEST_LINK_SO ?=	No
.if ${MODPY_TEST_LINK_SO:L} == "yes" && !empty(MODPY_TEST_LIBDIR)
MODPY_TEST_LINK_SRC ?=	${WRKSRC}
MODPY_TEST_SO_CMD = for _dir in ${MODPY_TEST_LIBDIR:S,:, ,g}; do \
	if [ -d $${_dir} ]; then \
		if [ $${_dir} != ${MODPY_TEST_LINK_SRC} ]; then \
			cd $${_dir} && \
			find . -name '*.so' -type f \
				-exec ln -sf $${_dir}/{} \
					${MODPY_TEST_LINK_SRC}/{} \; ;\
		fi; \
	fi; done
MODPY_TEST_TARGET +=	${MODPY_TEST_SO_CMD};
.endif

.if ${MODPY_PYBUILD:L} != no
.  if ! ${BUILD_DEPENDS:Mmisc/py-coherent.licensed}
_MODPY_PRE_BUILD_STEPS += ; if [ -e ${WRKSRC}/pyproject.toml ] && \
	(grep -A8 '^requires' ${WRKSRC}/pyproject.toml | \
	grep -q 'coherent.licensed'); then \
	    (echo; echo '*** Port may need BUILD_DEPENDS=misc/py-coherent.licensed'; \
		echo ) >> ${WRKDIR}/.modpy-warn; \
	fi
.  endif
.  if ! ${MODPY_PYBUILD:Msetuptools_scm} && ! ${BUILD_DEPENDS:Mdevel/py-setuptools_scm}
_MODPY_PRE_BUILD_STEPS += ; if [ -e ${WRKSRC}/pyproject.toml ] && \
	(grep -A8 '^requires' ${WRKSRC}/pyproject.toml | \
	grep -q 'setuptools[-_]scm'); then \
	    (echo; echo '*** Port may need MODPY_PYBUILD=setuptools_scm'; \
	        grep -H -e ^build-backend -e '^requires.*setuptools' \
		${WRKSRC}/pyproject.toml; echo ) >> ${WRKDIR}/.modpy-warn; \
	fi
.  endif
.  if ${_MODPY_EXPECTED_BACKEND} != other
_MODPY_PRE_BUILD_STEPS += ; if [ -e ${WRKSRC}/pyproject.toml ] && \
	grep '^build-backend' ${WRKSRC}/pyproject.toml | \
	grep -qvw ${_MODPY_EXPECTED_BACKEND}; then \
	    (echo; echo '*** Check MODPY_PYBUILD setting (currently "${MODPY_PYBUILD}")'; \
	        grep -H ^build-backend ${WRKSRC}/pyproject.toml; echo ) >> \
	        ${WRKDIR}/.modpy-warn; \
	fi
.  endif
MODPY_PYBUILD_ARGS ?=
MODPY_BUILD_TARGET = ${_MODPY_PRE_BUILD_STEPS}; \
	${_MODPY_RUNBIN} -sBm build -w --no-isolation ${MODPY_PYBUILD_ARGS}
MODPY_INSTALL_TARGET = \
	${INSTALL_DATA_DIR} ${WRKINST}${MODPY_LIBDIR}; \
	${_MODPY_RUNBIN} -m installer -d ${WRKINST} ${WRKSRC}/${_MODPY_WHEELSDIR}/*.whl
MODPY_TEST_TARGET +=	${MODPY_TEST_CMD}
.  if ${MODPY_PYTEST:L} == "yes"
MODPY_TEST_TARGET +=	${MODPY_PYTEST_ARGS}
.  endif
.else
MODPY_BUILD_TARGET = ${_MODPY_PRE_BUILD_STEPS}; \
	${MODPY_CMD} ${MODPY_DISTUTILS_BUILD} ${MODPY_DISTUTILS_BUILDARGS}
MODPY_INSTALL_TARGET = \
	${MODPY_CMD} ${MODPY_DISTUTILS_BUILD} ${MODPY_DISTUTILS_BUILDARGS} \
		${MODPY_DISTUTILS_INSTALL} ${MODPY_DISTUTILS_INSTALLARGS}

MODPY_TEST_TARGET +=	${MODPY_TEST_CMD}
.  if ${MODPY_PYTEST:L} == "yes"
MODPY_TEST_TARGET +=	${MODPY_PYTEST_ARGS}
.  elif ${MODPY_SETUPUTILS:L} == "yes"
MODPY_TEST_TARGET +=	${TEST_TARGET}
.  endif
.endif

MODPY_INSTALL_TARGET += ; if [ -r ${WRKDIR}/.modpy-warn ]; then cat ${WRKDIR}/.modpy-warn; fi

.if empty(CONFIGURE_STYLE)
.  if !target(do-configure) && ${_MODPY_USE_CARGO:L} == yes
do-configure:
	@${MODCARGO_configure}
.  endif

.  if !target(do-build)
do-build:
.    if ${_MODPY_USE_CARGO:L} == yes
	@${MODCARGO_BUILD_TARGET}
.    endif
.    if ${MODPY_PYBUILD} != maturin
	@${MODPY_BUILD_TARGET}
.    endif
.  endif

# extra documentation or scripts should be installed via post-install
.  if !target(do-install)
do-install:
	@${MODPY_INSTALL_TARGET}
.  endif

.  if !target(do-test) && \
      (${MODPY_SETUPUTILS:L} == "yes" || ${MODPY_PYTEST:L} == "yes")
do-test:
	@${MODPY_TEST_TARGET}
.  endif

.endif
