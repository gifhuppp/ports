COMMENT =	menu files for LXQt panel

NAME =		lxqt-menu-data

# doesn't work
CONFIGURE_ARGS=-DLXQT_ETC_XDG_DIR:PATH=${PREFIX}/share/examples/${NAME}

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/${NAME}
	mv ${WRKINST}/etc/xdg/menus ${PREFIX}/share/examples/${NAME}/

.include <bsd.port.mk>
