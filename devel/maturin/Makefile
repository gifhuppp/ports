COMMENT=	develop crates with pyo3, rust-cpython and cffi bindings

GH_ACCOUNT=	PyO3
GH_PROJECT=	maturin
GH_TAGNAME=	v1.9.2

CATEGORIES=	devel

# Apache 2.0
PERMIT_PACKAGE=	Yes

WANTLIB +=	${MODCARGO_WANTLIB} bz2 crypto m ssl zstd

MODULES=	devel/cargo

CONFIGURE_STYLE= cargo

# disable rustls/ring for sparc64 support
MODCARGO_NO_DEFAULT_FEATURES= yes
MODCARGO_FEATURES= cli-completion native-tls scaffolding upload

LIB_DEPENDS=	archivers/bzip2 \
		archivers/zstd

.include "crates.inc"

.include <bsd.port.mk>
