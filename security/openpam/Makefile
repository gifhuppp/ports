COMMENT=	Pluggable Authentication Module

V=		20241220
DISTNAME=	openbsd_pam-${V}
PKGNAME=	openpam-${V}
REVISION=	0

GH_ACCOUNT=	rnagy
GH_PROJECT=	openbsd_pam
GH_COMMIT=	5a83b8e19ec35b0860cc2dcdf52976d938198738

CATEGORIES=	security

SHARED_LIBS+=	pam	6.0

HOMEPAGE=	http://www.openpam.org/

MAINTAINER=	Robert Nagy <robert@openbsd.org>

# BSD
PERMIT_PACKAGE=	Yes

WANTLIB += util

WRKSRC=	${WRKDIST}/libpam

MAKE_FLAGS += 	BSDSRCDIR=${WRKDIST} BSDOBJDIR=${WRKBUILD} \
		OPENPAM=${WRKDIST}/openpam
MAKE_ENV+=	PAM_MOD_DIR=${TRUEPREFIX}/lib/security
CFLAGS+=	-DOPENPAM_MODULES_DIRECTORY="\"${TRUEPREFIX}/lib/security\""

PAM_MODULES=	deny echo exec nologin permit rootok \
		self bsdauth group

NO_TEST=	Yes

pre-build:
	cd ${WRKSRC} && ${MAKE} ${MAKE_FLAGS} obj

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/lib/security
	${INSTALL_DATA_DIR} ${PREFIX}/include/security
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/pam

	${INSTALL} ${FILESDIR}/system ${PREFIX}/share/examples/pam

.for _l in libpam.a libpam.so.$${LIBpam_VERSION} libpam_p.a
	${INSTALL} ${WRKSRC}/libpam/obj/${_l} ${PREFIX}/lib
.endfor
.for _i in openpam openpam_attr openpam_version pam_appl pam_constants pam_modules pam_types
	${INSTALL} ${WRKDIST}/openpam/include/security/${_i}.h ${PREFIX}/include/security
.endfor
	${INSTALL} ${WRKSRC}/libpam/security/pam_mod_misc.h ${PREFIX}/include/security

.for _m in ${PAM_MODULES}
	${INSTALL} ${WRKSRC}/modules/pam_${_m}/obj/libpam_${_m}.so.${LIBpam_VERSION} ${PREFIX}/lib/security/pam_${_m}.so
	${INSTALL} ${WRKSRC}/modules/pam_${_m}/pam_${_m}.8 ${PREFIX}/man/man8
.endfor

.include <bsd.port.mk>
