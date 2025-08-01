BROKEN-sparc64= attempted static link of dynamic object libglib-2.0.so.4201.13

COMMENT=		tool/library for managing platform virtualization

DISTNAME=		libvirt-11.6.0

CATEGORIES=		sysutils devel emulators

SHARED_LIBS += virt                      2.6 # 0.11006.0
SHARED_LIBS += virt-qemu                 2.3 # 0.11006.0
SHARED_LIBS += virt-lxc                  2.2 # 0.11006.0
SHARED_LIBS += virt-admin                2.2 # 0.11006.0

HOMEPAGE=		https://libvirt.org/

MAINTAINER=		Antoine Jacoutot <ajacoutot@openbsd.org>

# LGPLv2.1
PERMIT_PACKAGE=	Yes

WANTLIB += c curl gio-2.0 glib-2.0 gnutls gobject-2.0 intl json-c
WANTLIB += m pthread sasl2 ssh2 util xml2

SITES=			https://libvirt.org/sources/
EXTRACT_SUFX=		.tar.xz

# "#error You need at least GCC v4.8 to compile libvirt"
COMPILER=		base-clang ports-gcc
COMPILER_LANGS=		c

# scripts/rpcgen/tests/test_demo.c and also needed because rpcgen is used to
# create some .c and .h files which use this type
CFLAGS +=		-Dxdr_uint64_t=xdr_u_int64_t

MODULES=		devel/meson

BUILD_DEPENDS=		devel/gettext,-tools

# rst2html5
MODULES +=		lang/python
MODPY_RUNDEP=		No
BUILD_DEPENDS +=	textproc/py-docutils

# xsltproc(1)
BUILD_DEPENDS +=	textproc/libxslt

LIB_DEPENDS=		devel/glib2 \
			devel/json-c \
			net/curl \
			security/cyrus-sasl2 \
			security/gnutls \
			security/libssh2 \
			textproc/libxml

# OpenBSD can't act as a virtualization host, so we should disable libvirtd but
# but need it for qemu client support; we do not provide an rc.d script for
# libvirtd, virtlogd etc.
# do NOT enforce dependency on qemu since it brings lots of dependencies
#RUN_DEPENDS +=		emulators/qemu

# disable until proven useful
#.if ${MACHINE_ARCH} == "amd64" || ${MACHINE_ARCH} == "i386"
#RUN_DEPENDS +=		sysutils/dmidecode
#.endif

# -DFOO = XXX missing/bogus checks
CONFIGURE_ENV=		CPPFLAGS="-I${LOCALBASE}/include \
				-DAI_V4MAPPED=0 \
				-DHAVE_STRUCT_SOCKPEERCRED=1" \
			LDFLAGS="-L${LOCALBASE}/lib"

DISABLED_FEATURES=	wireshark_dissector apparmor attr audit capng fuse \
			glusterfs libiscsi libpcap polkit netcf numactl numad \
			openwsman selinux_mount selinux udev readline \
			driver_bhyve driver_hyperv driver_interface ssh_proxy \
			driver_libxl driver_lxc driver_openvz driver_vz \
			secdriver_apparmor secdriver_selinux nbdkit driver_ch \
			login_shell driver_network nss sysctl_config \
			git_werror libnl apparmor_profiles sanlock firewalld \
			firewalld_zone nbdkit_config_default userfaultfd_sysctl

# storage
DISABLED_FEATURES +=	storage_disk storage_fs storage_gluster storage_iscsi \
			storage_iscsi_direct storage_lvm storage_mpath \
			storage_rbd storage_vstorage storage_zfs

CONFIGURE_ARGS=		-Dinit_script=none \
			-Drunstatedir=/var/run

# XXX use a dedicated unpriv user/group? (e.g. _libvirt)
CONFIGURE_ARGS +=	-Dqemu_user=root \
			-Dqemu_group=wheel

.for _d in ${DISABLED_FEATURES}
CONFIGURE_ARGS +=	-D${_d}=disabled
.endfor

# needs readline support
CONFIGURE_ARGS +=	-Dbash_completion=disabled

# prefer libssh2
CONFIGURE_ARGS +=	-Dlibssh=disabled

# our sysutils/e2fsprogs is too old (<2.17)
CONFIGURE_ARGS +=	-Dblkid=disabled

DEBUG_PACKAGES=		${BUILD_PACKAGES}

post-install:
	rm -rf ${WRKINST}/var/{cache/libvirt,lib}
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples
	mv ${WRKINST}${SYSCONFDIR}/libvirt ${PREFIX}/share/examples/
	mv ${WRKINST}${SYSCONFDIR}/sasl2 ${PREFIX}/share/examples/libvirt/
	rm -rf ${WRKINST}${SYSCONFDIR}/logrotate.d ${WRKINST}/var/{log,run}

.include <bsd.port.mk>
