PKG_ARCH=	*

COMMENT=	patched fonts with symbols for powerline/airline

GH_ACCOUNT=	powerline
GH_PROJECT=	fonts
GH_COMMIT=	e80e3eba9091dac0655a0a77472e10f53e754bb0
DISTNAME=	powerline-fonts-0.20181111
REVISION=	0

CATEGORIES=	fonts

HOMEPAGE=	https://powerline.readthedocs.org/en/latest/

# see wrksrc/README.rst - SIL OFL, Apache 2.0, Ubuntu/DejaVu Font Licenses
PERMIT_PACKAGE=	Yes

NO_BUILD=	Yes
NO_TEST=	Yes

FONTS_DIR=	${PREFIX}/share/fonts/powerline

do-install:
	${INSTALL_DATA_DIR} ${FONTS_DIR} ${DOCS_DIR}
	cd ${WRKDIR}/fonts-${GH_COMMIT}; pax -rw [A-Z]* ${FONTS_DIR}
# XXX pkg_add:
# Updating font cache:
# Couldn't read /usr/local/share/fonts/powerline/Meslo: No such file or directory
	cd ${FONTS_DIR} && mv Meslo\ Dotted MesloDotted && \
		mv Meslo\ Slashed MesloSlashed
	chown -R ${SHAREOWN}:${SHAREGRP} ${FONTS_DIR}
	mv ${FONTS_DIR}/Terminus/PCF/* ${FONTS_DIR}/Terminus
	rm -rf ${FONTS_DIR}/Terminus/{BDF,PSF}
	rmdir ${FONTS_DIR}/Terminus/PCF
	rm -f ${FONTS_DIR}/*/fonts.dir ${FONTS_DIR}/*/fonts.scale

.include <bsd.port.mk>
