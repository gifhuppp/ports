COMMENT-main=		UW e-mail client
COMMENT-c-client=	UW c-client mail access routines
COMMENT-imap=		UW IMAP4rev1/POP2/POP3 mail servers
COMMENT-mailutil=	UW IMAP4rev1/POP2/POP3 mail utility
COMMENT-pico=		UW text editor
COMMENT-pilot=		UW file system navigator
FIX_EXTRACT_PERMISSIONS =	Yes

V=			2.26
PKGNAME-main=		alpine-${V}
PKGNAME-c-client=	c-client-${V}
PKGNAME-imap=		imap-uw-${V}
PKGNAME-mailutil=	mailutil-uw-${V}
# pico/pilot PKGNAMEs have different version numbers, so REVISION are
# set separately below (and shouldn't get removed when alpine is updated).
REVISION-main=		3
REVISION-c-client=	1
REVISION-imap=		1
REVISION-mailutil=	1

# grep "PICO version" ${WRKSRC}/pico/pico.h
PICO_V=			5.09
PKGNAME-pico=		pico-${PICO_V}
REVISION-pico=		26

# grep PILOT_VERSION ${WRKSRC}/pico/pilot.c
PILOT_V=		2.99
PKGNAME-pilot=		pilot-${PILOT_V}
REVISION-pilot=		26

DISTNAME=		alpine-${V}
EXTRACT_SUFX=		.tar.xz

SHARED_LIBS=		c-client 10.0

EPOCH-c-client=		0
EPOCH-imap=		0
EPOCH-mailutil=		0

CATEGORIES=		mail
CATEGORIES-main=	mail news
CATEGORIES-c-client=	devel mail
CATEGORIES-pico=	editors
CATEGORIES-pilot=	sysutils

HOMEPAGE=		https://alpineapp.email/

# Apache 2.0
PERMIT_PACKAGE=	Yes

# repo at https://repo.or.cz/alpine.git
SITES=			https://alpineapp.email/alpine/release/src/ \
			https://alpineapp.email/alpine/release/src/Old/

MULTI_PACKAGES=		-main -c-client -imap -mailutil -pico -pilot
DEBUG_PACKAGES=		${BUILD_PACKAGES}

WANTLIB += c crypto iconv intl curses pthread ssl

WANTLIB-c-client=	crypto ssl

LIB_DEPENDS=		devel/gettext,-runtime
LIB_DEPENDS-c-client=
BUILD_DEPENDS=		textproc/aspell/core
RUN_DEPENDS-main=	textproc/aspell/core
RUN_DEPENDS-pico=	textproc/aspell/core

SHLIB=			libc-client.so.${LIBc-client_VERSION}
MAKE_FLAGS=		EXTRACFLAGS="${CFLAGS}" \
			SHLIB="${SHLIB}" \
			SHLIBNAME=${SHLIB} \
			CC="${CC}"

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV=		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib" \
			ac_cv_search_regcomp=-lc \
			ac_cv_search_SSL_library_init="`pkg-config --libs openssl`"
CONFIGURE_ARGS=		--with-system-pinerc=${SYSCONFDIR}/pine.conf \
			--with-system-fixed-pinerc=${SYSCONFDIR}/pine.conf.fixed \
			--with-system-mail-directory=/var/mail \
			--with-ssl-certs-dir=/etc/ssl \
			--with-simple-spellcheck=aspell \
			--with-interactive-spellcheck=aspell \
			--with-c-client-target=bso \
			--with-debug-level=0 \
			--with-bundled-tools \
			--without-ldap \
			--without-tcl \
			--without-npa \
			--enable-quotas

post-install:
	# alpine, pico, pilot
	${INSTALL_DATA_DIR} ${PREFIX}/share/{doc,examples}/alpine
	${INSTALL_DATA} ${WRKSRC}/doc/tech-notes/tech-notes.txt \
		${WRKSRC}/doc/mailcap.unx \
		${WRKSRC}/doc/mime.types \
		${PREFIX}/share/doc/alpine
	# change default to use smtp rather than sendmail (smtpd incompatibility)
	${WRKBUILD}/alpine/alpine -conf | sed \
		's/^smtp-server=$$/smtp-server=localhost/' > \
		${PREFIX}/share/examples/alpine/pine.conf
	grep -q 'smtp-server=localhost' \
		${PREFIX}/share/examples/alpine/pine.conf \
		|| exit 1 # verify that sed was successful
	# c-client
	# the relevant os_*.h is copied to osdep.h in build; others not needed
	# XXX unsure if linkage.c actually needed
	${INSTALL_DATA_DIR} ${PREFIX}/include/c-client
	cd ${WRKSRC}/c-client; ${INSTALL_DATA} *.h linkage.c \
		${PREFIX}/include/c-client
	rm -f ${PREFIX}/include/c-client/os_*.h
	${INSTALL_DATA} ${WRKBUILD}/c-client/c-client.a \
		${PREFIX}/lib/libc-client.a
	@if [ -f ${WRKBUILD}/imap/c-client/${SHLIB} ]; then \
		${INSTALL_DATA} ${WRKSRC}/c-client/${SHLIB} ${PREFIX}/lib; \
	fi
	# imap-uw
	${INSTALL_PROGRAM} ${WRKBUILD}/imap/imapd/imapd ${PREFIX}/libexec
	${INSTALL_PROGRAM} ${WRKBUILD}/imap/ipopd/ipop2d ${PREFIX}/libexec
	${INSTALL_PROGRAM} ${WRKBUILD}/imap/ipopd/ipop3d ${PREFIX}/libexec
	${INSTALL_PROGRAM} ${WRKBUILD}/imap/mlock/mlock ${PREFIX}/libexec
	${INSTALL_PROGRAM} ${WRKBUILD}/imap/dmail/dmail ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKBUILD}/imap/tmail/tmail ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/imap/src/{imapd,ipopd}/*.8 \
		${PREFIX}/man/man8
	${INSTALL_MAN} ${WRKSRC}/imap/src/{dmail,tmail}/*.1 \
		${PREFIX}/man/man1
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/imap-uw
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/imap-uw
	${INSTALL_DATA} ${FILESDIR}/c-client.cf \
		${PREFIX}/share/examples/imap-uw
	tar -C ${WRKSRC}/imap/docs -cf - . | \
		tar -C ${PREFIX}/share/doc/imap-uw -xf -
	find ${PREFIX}/share/doc/imap-uw -type f -exec chmod 0644 {} +
	# mailutil
	${INSTALL_PROGRAM} ${WRKBUILD}/imap/mailutil/mailutil ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/imap/src/mailutil/mailutil.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
