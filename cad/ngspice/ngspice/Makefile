COMMENT =		circuit simulator, based on Berkeley SPICE

REVISION =	1

WANTLIB += ICE SM X11 Xau Xaw Xdmcp Xext Xmu Xpm Xt c m xcb

post-install:
	@rm -r ${PREFIX}/include/ngspice

.include <bsd.port.mk>
