COMMENT=		printer (CUPS) administration tool

V=			1.5.18
DISTNAME=		system-config-printer-${V}
REVISION=		4

CATEGORIES=		print sysutils

MAINTAINER=		Antoine Jacoutot <ajacoutot@openbsd.org>

# GPLv2
PERMIT_PACKAGE=	Yes

SITES=			https://github.com/OpenPrinting/system-config-printer/releases/download/v${V}/

MODULES=		lang/python
MODPY_SETUPTOOLS=	Yes

BUILD_DEPENDS=		devel/gettext,-tools \
			print/cups,-libs \
			textproc/xmlto

# desktop-file-install(1)
BUILD_DEPENDS +=	devel/desktop-file-utils

RUN_DEPENDS=		devel/desktop-file-utils \
			devel/py-gobject3 \
			graphics/py-cairo \
			print/cups-pk-helper \
			print/py-cups \
			x11/dbus-python

# pygobject introspections (not provided by indirect dependencies)
RUN_DEPENDS +=		devel/libnotify \
			x11/gnome/libsecret \
			x11/gtk+3

# GNOME dark mode; not enforcing since it's installed as part of GNOME
#RUN_DEPENDS +=		x11/libhandy

# only useful if cups is installed but don't enforce the dependency because
# gnome-control-center requires system-config-printer and we may not want cups
#RUN_DEPENDS +=		print/cups

USE_GMAKE=		Yes

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV=		CPPFLAGS=-I${LOCALBASE}/include \
			LDFLAGS=-L${LOCALBASE}/lib

FAKE_FLAGS=		dbusdir=${PREFIX}/share/examples/system-config-printer/dbus-1/system.d/ \
			autostartdir=${PREFIX}/share/examples/system-config-printer/xdg/autostart/ \
			cupshelpersdir=${PREFIX}/share/examples/system-config-printer/cupshelpers/

pre-configure:
	cd ${WRKSRC} && sed -i \
		-e "s,/usr/share/system-config-printer,${PREFIX}/share/system-config-printer,g;" \
		-e "s,/usr/local/share/ppd,${LOCALBASE}/share/ppd,g;" \
		-e "s,/usr/share/cups,${LOCALBASE}/share/cups,g;" \
		-e "s,/usr/lib/cups,${LOCALBASE}/libexec/cups,g;" \
		-e "s,/usr/lib64/cups,${LOCALBASE}/libexec/cups,g;" \
		-e "s,/usr/lib/cups,${LOCALBASE}/libexec/cups,g;" \
		-e "s,/usr/bin/cupstestppd,${LOCALBASE}/bin/cupstestppd,g" \
		check-device-ids.py \
		cupshelpers/cupshelpers.py \
		cupshelpers/xmldriverprefs.py \
		newprinter.py \
		probe_printer.py \
		udev/udev-configure-printer.c
	grep -rl "/usr/bin/python3" ${WRKSRC} | \
		xargs sed -i "s,/usr/bin/python3,${MODPY_BIN},g"

.include <bsd.port.mk>
