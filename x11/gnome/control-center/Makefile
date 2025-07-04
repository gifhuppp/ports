# XXX change proxy settings without network-manager?

COMMENT=		GNOME settings

GNOME_PROJECT=		gnome-control-center
# !!! sync MAJOR_VERSION (from meson.build) with meta/gnome "V" variable
GNOME_VERSION=		48.3

CATEGORIES=		x11

HOMEPAGE=		https://apps.gnome.org/Settings/

# GPLv2
PERMIT_PACKAGE=		Yes

WANTLIB += X11 Xi accountsservice adwaita-1 c cairo colord colord-gtk4
WANTLIB += cups epoxy fontconfig gcr-4 gdk_pixbuf-2.0 gio-2.0
WANTLIB += glib-2.0 gnome-bg-4 gnome-desktop-4 gnome-rr-4 gnutls
WANTLIB += goa-1.0 goa-backend-1.0 gobject-2.0 graphene-1.0 gsound
WANTLIB += gtk-4 gtop-2.0 ibus-1.0 intl json-glib-1.0 m pango-1.0
WANTLIB += polkit-gobject-1 pulse pulse-mainloop-glib pwquality
WANTLIB += secret-1 smbclient soup-3.0 upower-glib wayland-client
WANTLIB += xml2

MODULES=		devel/meson \
			devel/dconf \
			security/heimdal \
			x11/gnome

LIB_DEPENDS=		audio/gsound \
			audio/pulseaudio \
			devel/libgtop2 \
			graphics/colord-gtk \
			inputmethods/ibus \
			net/samba \
			print/cups,-libs \
			security/libpwquality \
			sysutils/accountsservice \
			sysutils/upower \
			x11/gnome/desktop,-gtk4 \
			x11/gnome/online-accounts \
			x11/gnome/libadwaita

BUILD_DEPENDS=		devel/iso-codes \
			devel/gsettings-desktop-schemas \
			x11/gnome/settings-daemon

# NOTE that a11y dependencies (e.g. caribou) are not enforced on purpose.
RUN_DEPENDS=		x11/gnome/settings-daemon \
			devel/iso-codes \
			devel/gsettings-desktop-schemas

# polkit(8) almost always needs to know the "active" session
RUN_DEPENDS +=		sysutils/consolekit

# needed for gnome-color-panel
RUN_DEPENDS +=		x11/gnome/color-manager

# needed for gnome-printers-panel
RUN_DEPENDS +=		print/cups-pk-helper \
			print/system-config-printer

# panels/keyboard/cc-input-list-box.c
BUILD_DEPENDS +=	x11/gnome/tecla
RUN_DEPENDS +=		x11/gnome/tecla

# panels/sound/cc-speaker-test-button.c:
# return g_strsplit ("audio-channel-front-left;audio-test-signal;bell", ";", -1);
RUN_DEPENDS +=		audio/sound-theme-freedesktop

# needed for gnome-region-panel; optional and would create a cyclic dep:
# gnome-session -> gnome-shell -> gnome-control-center -> gnome-session
#RUN_DEPENDS +=		x11/gnome/session

MODGNOME_TOOLS +=	desktop-file-utils docbook
MODGNOME_TOOLS +=	gtk-update-icon-cache yelp

MODGNOME_LDFLAGS=	-L${X11BASE}/lib

DEBUG_PACKAGES=		${BUILD_PACKAGES}

pre-configure:
	${SUBST_CMD} ${WRKSRC}/panels/printers/pp-host.c \
		${WRKSRC}/shell/meson.build

.include <bsd.port.mk>
