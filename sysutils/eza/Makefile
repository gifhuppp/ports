COMMENT =		ls alternative written in Rust (fork of exa)

GH_ACCOUNT =		eza-community
GH_PROJECT =		eza
GH_TAGNAME =		v0.23.0

HOMEPAGE =		https://eza.rocks/

MAINTAINER =		Volker Schlecht <openbsd-ports@schlecht.dev>

CATEGORIES =		sysutils

# EUPL-1.2
PERMIT_PACKAGE =	Yes

MODULES =		devel/cargo

.include "crates.inc"

CONFIGURE_STYLE =	cargo
SEPARATE_BUILD =	Yes
BUILD_DEPENDS =		textproc/lowdown

LIB_DEPENDS +=		devel/libgit2/libgit2
WANTLIB +=		${MODCARGO_WANTLIB} m git2

MODCARGO_FEATURES =	git

post-install:
.for sec name in 1 eza 5 eza_colors 5 eza_colors-explanation
	lowdown -s -tman -m section=${sec} -mtitle=${name} -mvolume='' ${WRKSRC}/man/${name}.${sec}.md > ${PREFIX}/man/man${sec}/${name}.${sec}
.endfor
	cd ${PREFIX}/share; ${INSTALL_DATA_DIR} fish/vendor_completions.d \
	    zsh/site-functions bash-completion/completions \
	    examples/eza/completions/nushell \
	    examples/eza/theme
	${INSTALL_DATA} ${WRKSRC}/completions/fish/eza.fish ${PREFIX}/share/fish/vendor_completions.d/
	${INSTALL_DATA} ${WRKSRC}/completions/zsh/_eza ${PREFIX}/share/zsh/site-functions/
	${INSTALL_DATA} ${WRKSRC}/completions/bash/eza ${PREFIX}/share/bash-completion/completions/
	${INSTALL_DATA} ${WRKSRC}/completions/nush/eza.nu ${PREFIX}/share/examples/eza/completions/nushell/
	${INSTALL_DATA} ${WRKSRC}/docs/theme.yml ${PREFIX}/share/examples/eza/theme/

.include <bsd.port.mk>
