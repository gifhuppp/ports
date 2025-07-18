COMMENT=	fast array and numeric programming library for Python

# numpy 2.3.x needs gcc 9.3 or newer
MODPY_DISTV=	2.2.6
DISTNAME=	numpy-${MODPY_DISTV}
PKGNAME=	py-${DISTNAME}
REVISION=	1

CATEGORIES=	math devel

HOMEPAGE=	https://numpy.org/

# BSD
PERMIT_PACKAGE=	Yes

COMPILER=	base-clang ports-gcc

WANTLIB += ${COMPILER_LIBCXX} ${MODPY_WANTLIB} m

# Disable dwz: it fails on DWARF 5 symbols due to 128-bit arithmetic in _pcg64.
# Alternative is CFLAGS += -D PCG_FORCE_EMULATED_128BIT_MATH
DWZ=		:
DEBUG_PACKAGES=	${BUILD_PACKAGES}

MODULES=	lang/python
MODPY_PYBUILD=	mesonpy
MODPY_PI=	Yes

# cython picks up pythran at runtime, so normally a dependency is
# enforced via python.port.mk to avoid problems with DPB junking.
# disable, to avoid a loop: cython -> pythran -> py-numpy -> cython
MODPY_CYTHON_PYTHRAN_RDEP= No

BUILD_DEPENDS=	devel/gas \
		lang/cython

# detected at runtime in crackfortran.py; checked at the start of run
# but not used until later. force the dep to ensure consistent results
# and avoid dpb junking issues.
RUN_DEPENDS=	textproc/py-charset-normalizer

TEST_DEPENDS=	${FULLPKGNAME}:${FULLPKGPATH} \
		devel/py-hypothesis \
		devel/py-test \
		devel/py-test-cov \
		devel/py-typing-extensions \
		devel/py-tz \
		devel/py-wheel

.include <bsd.port.arch.mk>
.if ${PROPERTIES:Mgcc49}
MODULES+=	fortran
BUILD_DEPENDS+=	${MODFORTRAN_BUILD_DEPENDS}
LIB_DEPENDS+=	${MODFORTRAN_LIB_DEPENDS} \
		math/lapack
WANTLIB+=	${MODFORTRAN_WANTLIB} blas cblas lapack
.endif

# Cython up to 0.28.4 used the discouraged __attribute__((optimize("Os")))
# which caused runtime breakage on at least macppc.
# -- see: https://marc.info/?l=openbsd-ports&m=153312266209561&w=2
#
# Some related Cython issues:
#   https://github.com/cython/cython/issues/2102
#   https://github.com/cython/cython/issues/2235
#   https://github.com/cython/cython/issues/2494
#
# Cython 0.28.5 and newer switched to __attribute__((cold)).
# Leave this disabled on macppc unless someone retests on that
# platform.
#
.if ${MACHINE_ARCH} == powerpc
CFLAGS +=	-D CYTHON_SMALL_CODE=
.endif

pre-build:
	cp -f ${WRKSRC}/numpy/distutils/site.cfg ${WRKSRC}/site.cfg
	ln -sf ${LOCALBASE}/bin/gas ${WRKDIR}/bin/as

# cpu optimizations (where supported) are runtime detected, but there's
# some problem on i386 where they trigger segfaults in numpy's regression
# tests, and in other programs using numpy (e.g. building makehuman).
# tests look good on amd64 arm64 riscv64 as-is.
# numpy's regressions tests result in segv on powerpc (and also did in
# 1.19.5) but at least some normal runtime seems ok (makehuman builds).
# https://github.com/numpy/numpy/issues/20799
.if ${MACHINE_ARCH} == i386
	sed -i '/^option.*disable-optim/ s/false/true/' ${WRKSRC}/meson.options
.endif

do-test:
	cd ${WRKDIR} && ${MAKE_ENV} ${MODPY_BIN} -c \
	    'import numpy ; numpy.test(verbose=2)'

.include <bsd.port.mk>
