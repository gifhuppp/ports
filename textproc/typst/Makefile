COMMENT =	markup-based typesetting system

DISTNAME =	typst-${V}
V =		0.13.1

DIST_TUPLE +=	github typst typst v${V} .
DIST_TUPLE +=	github typst typst-dev-assets v${V} crates/typst-dev-assets

CATEGORIES =	textproc

HOMEPAGE =	https://typst.app/
MAINTAINER =	Sebastien Marie <semarie@kapouay.eu.org>

# Apache-2.0
PERMIT_PACKAGE =	Yes

WANTLIB +=	${MODCARGO_WANTLIB} crypto m ssl

MODULES =	devel/cargo

MODCARGO_INSTALL_TARGET_PATHS =	crates/typst-cli
MODCARGO_TEST_ARGS =	--workspace

CONFIGURE_STYLE =	cargo
SEPARATE_BUILD =	Yes

pre-patch:
	sed -ie '/github.com\/typst\/typst-dev-assets\?tag=/d' \
		${WRKSRC}/Cargo.lock
	sed -ie 's/typst-dev-assets = { [^}]* }/typst-dev-assets = { path = "crates\/typst-dev-assets" }/' \
		${WRKSRC}/Cargo.toml

.include "crates.inc"
.include <bsd.port.mk>
