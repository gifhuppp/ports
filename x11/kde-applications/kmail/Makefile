USE_WXNEEDED =	Yes

COMMENT =	KDE PIM email client
DISTNAME =	kmail-${VERSION}
CATEGORIES =	net mail
REVISION =	0

HOMEPAGE =	https://kontact.kde.org/components/kmail/

SHARED_LIBS +=	mailfilteragentprivate    0.0 # 0.0
SHARED_LIBS +=  kmailprivate              10.0 # 5.13.2

WANTLIB += ${COMPILER_LIBCXX} GL KF6Bookmarks KF6CalendarCore
WANTLIB += KF6Codecs KF6ColorScheme KF6Completion KF6ConfigCore
WANTLIB += KF6ConfigGui KF6ConfigWidgets KF6Contacts KF6CoreAddons
WANTLIB += KF6Crash KF6DBusAddons KF6GuiAddons KF6I18n KF6IconThemes
WANTLIB += KF6IconWidgets KF6ItemModels KF6ItemViews KF6JobWidgets
WANTLIB += KF6KCMUtils KF6KCMUtilsCore KF6KCMUtilsQuick KF6KIOCore
WANTLIB += KF6KIOFileWidgets KF6KIOGui KF6KIOWidgets KF6Notifications
WANTLIB += KF6NotifyConfig KF6Parts KF6Service KF6Solid KF6SonnetUi
WANTLIB += KF6StatusNotifierItem KF6SyntaxHighlighting KF6TextAutoCorrectionCore
WANTLIB += KF6TextAutoCorrectionWidgets KF6TextCustomEditor KF6TextEditTextToSpeech
WANTLIB += KF6TextTemplate KF6TextUtils KF6UserFeedbackCore KF6UserFeedbackWidgets
WANTLIB += KF6WidgetsAddons KF6WindowSystem KF6XmlGui KPim6AkonadiAgentBase
WANTLIB += KPim6AkonadiContactCore KPim6AkonadiContactWidgets
WANTLIB += KPim6AkonadiCore KPim6AkonadiMime KPim6AkonadiSearchDebug
WANTLIB += KPim6AkonadiSearchPIM KPim6AkonadiWidgets KPim6CalendarUtils
WANTLIB += KPim6GrantleeTheme KPim6Gravatar KPim6IMAP KPim6IdentityManagementCore
WANTLIB += KPim6IdentityManagementWidgets KPim6KManageSieve KPim6KSieve
WANTLIB += KPim6KSieveCore KPim6KSieveUi KPim6KontactInterface
WANTLIB += KPim6LdapCore KPim6LdapWidgets KPim6Libkdepim KPim6Libkleo
WANTLIB += KPim6MailCommon KPim6MailTransport KPim6MessageComposer
WANTLIB += KPim6MessageCore KPim6MessageList KPim6MessageViewer
WANTLIB += KPim6Mime KPim6MimeTreeParser KPim6PimCommon KPim6PimCommonActivities
WANTLIB += KPim6PimCommonAkonadi KPim6TemplateParser KPim6TextEdit
WANTLIB += KPim6Tnef KPim6WebEngineViewer PlasmaActivities Qt6Core
WANTLIB += Qt6DBus Qt6Gui Qt6Network Qt6OpenGL Qt6Positioning
WANTLIB += Qt6PrintSupport Qt6Qml Qt6QmlMeta Qt6QmlModels Qt6QmlWorkerScript
WANTLIB += Qt6Quick Qt6WebChannel Qt6WebEngineCore Qt6WebEngineWidgets
WANTLIB += Qt6Widgets Qt6Xml X11 assuan c gpg-error gpgme gpgmepp
WANTLIB += m qgpgmeqt6 qt6keychain

MODKDE_ICON_CACHE = yes
MODKDE_TRANSLATIONS = yes
MODKDE_DESKTOP_FILE = yes
MODKDE_DOCS = yes

MODKF5_L10N_CONFLICT = yes
MODKF5_I18N_CONFLICT = yes

BUILD_DEPENDS =	devel/boost \
		devel/kf6/kwallet

RUN_DEPENDS =	x11/kde-applications/akonadi-import-wizard>=${VERSION} \
		x11/kde-applications/kdepim-runtime>=${VERSION} \
		x11/kde-applications/kmail-account-wizard>=${VERSION} \
		x11/kde-applications/mbox-importer>=${VERSION} \
		x11/kde-applications/pim-sieve-editor>=${VERSION} \
		devel/kf6/kwallet

LIB_DEPENDS =	devel/kf6/kbookmarks \
		devel/kf6/kcalendarcore \
		devel/kf6/kcmutils \
		devel/kf6/kcodecs \
		devel/kf6/kcolorscheme \
		devel/kf6/kcompletion \
		devel/kf6/kconfig \
		devel/kf6/kconfigwidgets \
		devel/kf6/kcontacts \
		devel/kf6/kcoreaddons \
		devel/kf6/kcrash \
		devel/kf6/kdbusaddons \
		devel/kf6/kguiaddons \
		devel/kf6/ki18n \
		devel/kf6/kiconthemes \
		devel/kf6/kio \
		devel/kf6/kitemmodels \
		devel/kf6/kitemviews \
		devel/kf6/kjobwidgets \
		devel/kf6/knotifications \
		devel/kf6/knotifyconfig \
		devel/kf6/kparts \
		devel/kf6/kservice \
		devel/kf6/kstatusnotifieritem \
		devel/kf6/kstatusnotifieritem \
		devel/kf6/ktexttemplate \
		devel/kf6/ktextwidgets \
		devel/kf6/kuserfeedback \
		devel/kf6/kwidgetsaddons \
		devel/kf6/kwindowsystem \
		devel/kf6/kxmlgui \
		devel/kf6/solid \
		devel/kf6/sonnet \
		devel/kf6/syntax-highlighting \
		security/gpgme,-qt \
		security/libassuan \
		security/qtkeychain,qt6 \
		textproc/ktextaddons \
		security/libgpg-error \
		x11/kde-plasma/plasma-activities \
		x11/kde-applications/akonadi-contacts>=${VERSION} \
		x11/kde-applications/akonadi-mime>=${VERSION} \
		x11/kde-applications/akonadi-search>=${VERSION} \
		x11/kde-applications/akonadi>=${VERSION} \
		x11/kde-applications/grantleetheme \
		x11/kde-applications/kcalutils>=${VERSION} \
		x11/kde-applications/kidentitymanagement>=${VERSION} \
		x11/kde-applications/kimap>=${VERSION} \
		x11/kde-applications/kldap>=${VERSION} \
		x11/kde-applications/kmailtransport>=${VERSION} \
		x11/kde-applications/kmime>=${VERSION} \
		x11/kde-applications/kontactinterface>=${VERSION} \
		x11/kde-applications/kpimtextedit>=${VERSION} \
		x11/kde-applications/ktnef>=${VERSION} \
		x11/kde-applications/libgravatar>=${VERSION} \
		x11/kde-applications/libkdepim>=${VERSION} \
		x11/kde-applications/libkleo>=${VERSION} \
		x11/kde-applications/libksieve>=${VERSION} \
		x11/kde-applications/mailcommon>=${VERSION} \
		x11/kde-applications/messagelib>=${VERSION} \
		x11/kde-applications/pimcommon>=${VERSION} \
		x11/qt6/qtdeclarative \
		x11/qt6/qtpositioning \
		x11/qt6/qtwebchannel \
		x11/qt6/qtwebengine

TEST_IS_INTERACTIVE =	X11

DEBUG_PACKAGES =	${BUILD_PACKAGES}

.include <bsd.port.mk>
