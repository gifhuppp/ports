COMMENT =	ruby wrapper for comrak rust crate

DISTNAME =	commonmarker-2.3.1
CATEGORIES =	textproc
HOMEPAGE =	https://github.com/gjtorikian/commonmarker

# MIT License
PERMIT_PACKAGE =	Yes

MODULES =	devel/cargo \
		lang/clang \
		lang/ruby

WANTLIB +=	${MODCARGO_WANTLIB} onig

BUILD_DEPENDS =	devel/ruby-rb_sys,${MODRUBY_FLAVOR}>=0.9
LIB_DEPENDS =	textproc/oniguruma
RUN_DEPENDS =	devel/ruby-rb_sys,${MODRUBY_FLAVOR}>=0.9

CONFIGURE_STYLE = ruby gem ext cargo

# When updating:
# make clean extract
# make modcargo-gen-crates > crates.inc
# make makesum
# make clean configure
# make modcargo-gen-crates-licenses > crates.licenses.inc
# mv crates.licenses.inc crates.inc

MODCARGO_VENDOR_DIR = ${WRKDIR}/modcargo-crates
MODCARGO_BUILD = No
MODCARGO_INSTALL = No

USE_GMAKE = Yes
CONFIGURE_ENV =	MAKE=gmake
MAKE_ENV =	MAKE=gmake \
		RUBY=${RUBY} \
		HOME=${WRKSRC} \
		LIBCLANG_PATH=${PREFIX}/llvm${MODCLANG_VERSION}/lib \
		RB_SYS_EXTRA_CARGO_ARGS=--verbose \
		RB_SYS_VERBOSE=true \
		CARGO_TERM_VERBOSE=true \
		RUST_BACKTRACE=1 \
		V=1 \
		${MODCARGO_ENV}

.include "crates.inc"

.include <bsd.port.mk>
