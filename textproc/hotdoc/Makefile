COMMENT=		documentation tool micro-framework

MODPY_DISTV=		0.17.4
DISTNAME=		hotdoc-${MODPY_DISTV}
REVISION=		0

CATEGORIES=		textproc

HOMEPAGE=		https://hotdoc.github.io/

MAINTAINER=		Antoine Jacoutot <ajacoutot@openbsd.org>

# LGPLv2.1+
PERMIT_PACKAGE=		Yes

WANTLIB += gio-2.0 glib-2.0 gobject-2.0 intl json-glib-1.0 xml2

MODULES=		lang/python

MODPY_PI=		Yes
MODPY_PYBUILD=		setuptools

BUILD_DEPENDS=		devel/cmake/core

LIB_DEPENDS=		devel/json-glib \
			textproc/libxml

RUN_DEPENDS=		devel/py-appdirs \
			devel/py-dbus-deviation \
			devel/py-decorator \
			devel/py-pkgconfig \
			devel/py-schema \
			devel/py-toposort \
			devel/py-wheezy.template \
			math/py-networkx>=2.6.2 \
			textproc/py-cchardet \
			textproc/py-lxml \
			textproc/py-yaml

# XXX only include what we need from backports (unported)
SITES.pybackports=	https://files.pythonhosted.org/packages/fc/25/dae014b114397a6f60578d7358bf5fcb103f71556e5363a50d7b42e9bc51/
DISTFILES.pybackports=	backports.entry_points_selectable-1.3.0.tar.gz
post-install:
	${INSTALL_DATA_DIR} ${WRKINST}/${MODPY_SITEPKG}
	cp -a ${WRKDIR}/backports.entry_points_selectable-1.3.0/backports/ \
		${WRKINST}/${MODPY_SITEPKG}
	${MODPY_COMPILEALL} ${WRKINST}/${MODPY_SITEPKG}/backports/

# LGPLv2.1+
.include <bsd.port.mk>
