COMMENT =	PIM Akonadi import wizard
DISTNAME =	akonadi-import-wizard-${VERSION}
CATEGORIES =	devel

SHARED_LIBS +=	KPim6ImportWizard         0.0 # 0.0

WANTLIB += ${COMPILER_LIBCXX} GL KF6Archive KF6ColorScheme KF6Completion
WANTLIB += KF6ConfigCore KF6ConfigGui KF6ConfigWidgets KF6Contacts
WANTLIB += KF6CoreAddons KF6Crash KF6DBusAddons KF6I18n KF6IconThemes
WANTLIB += KF6ItemModels KF6KIOCore KF6Service KF6TextAutoCorrectionCore
WANTLIB += KF6TextAutoCorrectionWidgets KF6TextCustomEditor KF6TextTemplate
WANTLIB += KF6WidgetsAddons KF6XmlGui KPim6AkonadiContactCore
WANTLIB += KPim6AkonadiContactWidgets KPim6AkonadiCore KPim6AkonadiMime
WANTLIB += KPim6AkonadiWidgets KPim6GrantleeTheme KPim6IMAP KPim6IdentityManagementCore
WANTLIB += KPim6IdentityManagementWidgets KPim6Libkdepim KPim6Libkleo
WANTLIB += KPim6MailCommon KPim6MailImporter KPim6MailImporterAkonadi
WANTLIB += KPim6MailTransport KPim6MessageComposer KPim6MessageCore
WANTLIB += KPim6MessageViewer KPim6Mime KPim6MimeTreeParser KPim6PimCommon
WANTLIB += KPim6PimCommonAkonadi KPim6TextEdit Qt6Core Qt6DBus
WANTLIB += Qt6Gui Qt6Network Qt6Widgets Qt6Xml assuan c gpgme
WANTLIB += gpgmepp m qgpgmeqt6 qt6keychain

MODKDE_TRANSLATIONS = yes
MODKDE_ICON_CACHE = yes
MODKDE_DESKTOP_FILE = yes

MODKF5_L10N_CONFLICT = yes
MODKF5_I18N_CONFLICT = yes

BUILD_DEPENDS =	devel/boost

LIB_DEPENDS =	devel/kf6/karchive \
		devel/kf6/kcolorscheme \
		devel/kf6/kcompletion \
		devel/kf6/kconfig \
		devel/kf6/kconfigwidgets \
		devel/kf6/kcontacts \
		devel/kf6/kcoreaddons \
		devel/kf6/kcrash \
		devel/kf6/kdbusaddons \
		devel/kf6/ki18n \
		devel/kf6/kio \
		devel/kf6/kitemmodels \
		devel/kf6/kservice \
		devel/kf6/ktexttemplate \
		devel/kf6/kwidgetsaddons \
		devel/kf6/kiconthemes \
		devel/kf6/kxmlgui \
		security/gpgme,-qt \
		security/libassuan \
		security/qtkeychain,qt6 \
		textproc/ktextaddons \
		x11/kde-applications/akonadi-contacts>=${MODKDE_GEAR_VERSION} \
		x11/kde-applications/akonadi-mime>=${MODKDE_GEAR_VERSION} \
		x11/kde-applications/akonadi>=${MODKDE_GEAR_VERSION} \
		x11/kde-applications/grantleetheme>=${MODKDE_GEAR_VERSION} \
		x11/kde-applications/kidentitymanagement>=${MODKDE_GEAR_VERSION} \
		x11/kde-applications/kimap>=${MODKDE_GEAR_VERSION} \
		x11/kde-applications/kmailtransport>=${MODKDE_GEAR_VERSION} \
		x11/kde-applications/kmime>=${MODKDE_GEAR_VERSION} \
		x11/kde-applications/kpimtextedit>=${MODKDE_GEAR_VERSION} \
		x11/kde-applications/libkdepim>=${MODKDE_GEAR_VERSION} \
		x11/kde-applications/libkleo>=${MODKDE_GEAR_VERSION} \
		x11/kde-applications/mailcommon>=${MODKDE_GEAR_VERSION} \
		x11/kde-applications/mailimporter>=${MODKDE_GEAR_VERSION} \
		x11/kde-applications/messagelib>=${MODKDE_GEAR_VERSION} \
		x11/kde-applications/pimcommon>=${MODKDE_GEAR_VERSION}

.include <bsd.port.mk>
