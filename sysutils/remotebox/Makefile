COMMENT=		VirtualBox client with remote management

DISTNAME=		RemoteBox-3.6
PKGNAME=		${DISTNAME:L}
EXTRACT_SUFX=		.tar.bz2

CATEGORIES=		sysutils x11 emulators

HOMEPAGE=		http://remotebox.knobgoblin.org.uk/

MAINTAINER=		Antoine Jacoutot <ajacoutot@openbsd.org>

# GPLv2
PERMIT_PACKAGE=	Yes

SITES=			http://remotebox.knobgoblin.org.uk/downloads/

NO_BUILD=		Yes
NO_TEST=		Yes
PKG_ARCH=		*

RUN_DEPENDS=		devel/desktop-file-utils \
			devel/xdg-utils \
			sysutils/p5-File-Which \
			textproc/p5-Regexp-Common \
			www/p5-SOAP-Lite \
			www/p5-libwww \
			x11/freerdp \
			x11/p5-Gtk3

pre-configure:
	${SUBST_CMD} ${WRKSRC}/remotebox

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/{appdata,applications,pixmaps}
	${INSTALL_SCRIPT} ${WRKSRC}/remotebox ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/packagers-readme/remotebox.desktop \
		${PREFIX}/share/applications/
	${INSTALL_DATA} ${WRKSRC}/packagers-readme/remotebox.appdata.xml \
		${PREFIX}/share/appdata/
	ln -sf ${TRUEPREFIX}/share/remotebox/icons/remotebox.png \
		${PREFIX}/share/pixmaps/
	cp -Rp ${WRKSRC}/share/remotebox ${PREFIX}/share
	chown -R ${SHAREOWN}:${SHAREGRP} ${PREFIX}/share/remotebox

.include <bsd.port.mk>
