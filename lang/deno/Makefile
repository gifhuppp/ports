# deno only supports amd64 and arm64
ONLY_FOR_ARCHS =	amd64 aarch64
COMMENT =		runtime for JavaScript and TypeScript

DPB_PROPERTIES =	parallel

USE_WXNEEDED =		Yes

VERSION =		2.4.3
HOMEPAGE =		https://deno.com/runtime

DISTNAME =		deno-${VERSION}
DISTFILES =		${DISTNAME}{deno_src}${EXTRACT_SUFX}
SITES 	=		https://github.com/denoland/deno/releases/download/v${VERSION}/

MAINTAINER =		Volker Schlecht <openbsd-ports@schlecht.dev>

CATEGORIES =		lang

# MIT
PERMIT_PACKAGE =	Yes

MODULES =		devel/cargo lang/clang
MODCARGO_CRATES_KEEP +=	libsqlite3-sys \
			libz-sys

MODCARGO_CRATES_UPDATE += aws-lc-rs aws-lc-sys

MODCARGO_ENV +=		V8_FROM_SOURCE=1 \
			GN=${LOCALBASE}/bin/gn \
			NINJA=${LOCALBASE}/bin/ninja \
			CLANG_BASE_PATH=/usr \
			HOME=${PORTHOME} \
			LIBCLANG_PATH=${LOCALBASE}/llvm${MODCLANG_VERSION}/lib \
			GN_ARGS="clang_use_chrome_plugins=false \
			extra_cppflags=\"-idirafter ${LOCALBASE}/include -idirafter ${X11BASE}/include\" \
			extra_ldflags=\"-L${LOCALBASE}/lib -L${X11BASE}/lib\" \
			fatal_linker_warnings=false \
			is_clang=true \
			use_custom_libcxx=true \
			use_custom_libunwind=true \
			use_udev=true \
			use_sysroot=false \
			use_glib=false \
			v8_enable_cet_ibt=true"

# Makes the build look more alive while compiling v8
MODCARGO_BUILD_ARGS +=	-vv

MODCARGO_RUSTFLAGS +=	-L${LOCALBASE}/lib

MODCARGO_TEST_ARGS +=	--no-fail-fast

MAKE_ENV =		${MODCARGO_ENV}

COMPILER =		ports-clang
WANTLIB +=		${MODCARGO_WANTLIB} m execinfo ffi zstd

BUILD_DEPENDS =		databases/sqlite3 \
			devel/cmake/core \
			devel/gmake \
			devel/gn \
			devel/ninja \
			devel/protobuf-c \
			lang/rust,-rustfmt \
			${RUN_DEPENDS}

LIB_DEPENDS =		archivers/zstd \
			devel/libffi

RUN_DEPENDS =		sysutils/libudev-openbsd

.include "crates.inc"

CONFIGURE_STYLE =	cargo

DOCDIR =		${PREFIX}/share/doc/deno
WRKDIST =		${WRKDIR}/deno
PORTHOME =		${WRKSRC}

DENO_CORE_ICUDATA_V =	0.74.0
V8_CARGO_V =		137.2.1

V8_DISTDIR =		${MODCARGO_VENDOR_DIR}/v8-${V8_CARGO_V}
V8_BPGO_DIR =		${V8_DISTDIR}/v8/tools/builtins-pgo

SUBST_VARS +=		WRKBUILD WRKSRC

post-patch:
	mkdir -p ${V8_BPGO_DIR}/{x64.profile,arm64.profile}
	${SUBST_CMD} ${V8_DISTDIR}/v8/tools/run.py
	cd ${WRKSRC} && ${SUBST_CMD} \
	    cli/task_runner.rs \
	    cli/tools/jupyter/install.rs \
	    ext/os/lib.rs \
	    tests/util/server/src/lib.rs
	cp ${WRKSRC}/ext/napi/generated_symbol_exports_list_linux.def \
	    ${WRKSRC}/ext/napi/generated_symbol_exports_list_openbsd.def
	mkdir ${V8_DISTDIR}/third_party/icu/common
	cp ${MODCARGO_VENDOR_DIR}/deno_core_icudata-${DENO_CORE_ICUDATA_V}/src/icudtl.dat \
	    ${V8_DISTDIR}/third_party/icu/common/

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/target/release/deno ${PREFIX}/bin
	${INSTALL_DATA_DIR} ${DOCDIR}
	${INSTALL_DATA} ${WRKSRC}/{LICENSE.md,README.md} ${DOCDIR}

.include <bsd.port.mk>
