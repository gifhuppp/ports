#! /usr/bin/perl

# ex:ts=8 sw=4:
# $OpenBSD: Quirks.pm,v 1.1761 2025/11/01 14:28:23 sthen Exp $
#
# Copyright (c) 2009 Marc Espie <espie@openbsd.org>
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

use strict;
use warnings;
use OpenBSD::PackageName;

package OpenBSD::Quirks;

sub new
{
	my ($class, $version) = @_;
	if ($version <= 5) {
		return OpenBSD::Quirks5->new;
	} else {
		return undef;
	}
}

package OpenBSD::Quirks5;
use Config;
sub new
{
	my $class = shift;

	bless {}, $class;
}


# ->tweak_list(\@l, $state):
#	allows Quirks to do anything to the list of packages to install,
#	if something is needed. Usually, it won't do anything
sub tweak_list
{
}

# packages to remove
# stem => existing file   hash table
#	if file exists, then it's now in base and we can remove it.

my $p5a = $Config{archlib};
my $p5 = "/usr/libdata/perl5";
my $base_exceptions = {
# 7.7
	'p5-Test2-Suite' => '/usr/libdata/perl5/Test2/Suite.pm',
	'p5-Term-Table' => '/usr/libdata/perl5/Term/Table.pm',
	'pkgconf' => '/usr/bin/pkg-config',
};

my $stem_extensions = {
# 7.0
	'weboob' => 'woob',
	'py-talloc' => 'py3-talloc',
	'py-tdb' => 'py3-tdb',
	'bijiben' => 'gnome-notes',
	'connections' => 'gnome-connections',
	'py-socketio-client' => 'py3-socketio-client',
	'py-cycler' => 'py3-cycler',
	'py-pyRFC3339' => 'py3-pyRFC3339',
	'py-libarchive-c' => 'py3-libarchive-c',
	'py-minimalmodbus' => 'py3-minimalmodbus',
	'baresip-gtk2' => 'baresip-gtk',
	'py-xlib' => 'py3-xlib',
	'py-neovim' => 'py3-neovim',
	'py-click-log' => 'py3-click-log',
	'py-click-plugins' => 'py3-click-plugins',
	'py-click-threading' => 'py3-click-threading',
	'py-spark-parser' => 'py3-spark-parser',
	'py-xdis' => 'py3-xdis',
	'py-uncompyle6' => 'py3-uncompyle6',
	'py-click' => 'py3-click',
	'py-pyinotify' => 'py3-pyinotify',
	'py-virtualdisplay' => 'py3-virtualdisplay',
	'py-meld3' => 'py3-meld3',
	'py-cryptography_vectors' => 'py3-cryptography_vectors',
	'py-boto' => 'py3-boto3',
	'py3-boto' => 'py3-boto3',
	'py-paramiko' => 'py3-paramiko',
	'py-nxos' => 'py3-nxos',
	'py-scp' => 'py3-scp',
	'py-bcrypt' => 'py3-bcrypt',
	'py-iso8601' => 'py3-iso8601',
	'py-asn1crypto' => 'py3-asn1crypto',
	'py-asn1' => 'py3-asn1',
	'py-snmp' => 'py3-snmp',
	'py-PyNaCl' => 'py3-PyNaCl',
	'py-websocket-client' => 'py3-websocket-client',
	'libmesode' => 'libstrophe',
	'py-stem' => 'py3-stem',
# 7.1
	'py-jsonschema' => 'py3-jsonschema',
	'py-CherryPy' => 'py3-CherryPy',
	'py-IP' => 'py3-IP',
	'py-PySMT' => 'py3-PySMT',
	'py-aes' => 'py3-aes',
	'py-affine' => 'py3-affine',
	'py-beaker' => 'py3-beaker',
	'py-betamax' => 'py3-betamax',
	'py-bleach' => 'py3-bleach',
	'py-bottle' => 'py3-bottle',
	'py-cached-property' => 'py3-cached-property',
	'py-cheroot' => 'py3-cheroot',
	'py-cookies' => 'py3-cookies',
	'py-country' => 'py3-country',
	'py-coveralls' => 'py3-coveralls',
	'py-curl' => 'py3-curl',
	'py-eapi' => 'py3-eapi',
	'py-fasteners' => 'py3-fasteners',
	'py-feedgenerator' => 'py3-feedgenerator',
	'py-fields' => 'py3-fields',
	'py-formencode' => 'py3-formencode',
	'py-ftpdlib' => 'py3-ftpdlib',
	'py-graphviz' => 'py3-graphviz',
	'py-html5lib' => 'py3-html5lib',
	'py-httplib2' => 'py3-httplib2',
	'py-icalendar' => 'py3-icalendar',
	'py-jinja2' => 'py3-jinja2',
	'py-mako' => 'py3-mako',
	'py-mistune' => 'py3-mistune',
	'py-mpmath' => 'py3-mpmath',
	'py-netaddr' => 'py3-netaddr',
	'py-netifaces' => 'py3-netifaces',
	'py-num2words' => 'py3-num2words',
	'py-objgraph' => 'py3-objgraph',
	'py-paho-mqtt' => 'py3-paho-mqtt',
	'py-parsedatetime' => 'py3-parsedatetime',
	'py-path.py' => 'py3-path.py',
	'py-pcapy' => 'py3-pcapy',
	'py-pf' => 'py3-pf',
	'py-pgpdump' => 'py3-pgpdump',
	'py-polib' => 'py3-polib',
	'py-portend' => 'py3-portend',
	'py-potr' => 'py3-potr',
	'py-prettytable' => 'py3-prettytable',
	'py-pyaml' => 'py3-pyaml',
	'py-pykwalify' => 'py3-pykwalify',
	'py-radix' => 'py3-radix',
	'py-redis' => 'py3-redis',
	'py-repoze-lru' => 'py3-repoze-lru',
	'py-repoze-profile' => 'py3-repoze-profile',
	'py-repoze-who' => 'py3-repoze-who',
	'py-requests-aws4auth' => 'py3-requests-aws4auth',
	'py-requests-futures' => 'py3-requests-futures',
	'py-requests-mock' => 'py3-requests-mock',
	'py-requests-toolbelt' => 'py3-requests-toolbelt',
	'py-rrdtool' => 'py3-rrdtool',
	'py-ruamel.yaml' => 'py3-ruamel.yaml',
	'py-scrypt' => 'py3-scrypt',
	'py-selenium' => 'py3-selenium',
	'py-simplesoap' => 'py3-simplesoap',
	'py-soupsieve' => 'py3-soupsieve',
	'py-spdx' => 'py3-spdx',
	'py-spdx-lookup' => 'py3-spdx-lookup',
	'py-tempita' => 'py3-tempita',
	'py-unidecode' => 'py3-unidecode',
	'py-uritemplate' => 'py3-uritemplate',
	'py-vobject' => 'py3-vobject',
	'py-waitress' => 'py3-waitress',
	'py-webencodings' => 'py3-webencodings',
	'py-xmltodict' => 'py3-xmltodict',
	'py-jaraco-functools' => 'py3-jaraco-functools',
	'py-logilab-common' => 'py3-logilab-common',
	'py-memcached' => 'py3-memcached',
	'py-tempora' => 'py3-tempora',
	'py-redland' => 'py3-redland',
	'py-GitPython' => 'py3-GitPython',
	'py-ICU' => 'py3-ICU',
	'py-MarkupSafe' => 'py3-MarkupSafe',
	'py-PEG2' => 'py3-PEG2',
	'py-PyPDF2' => 'py3-PyPDF2',
	'py-ana' => 'py3-ana',
	'py-anytree' => 'py3-anytree',
	'py-appdirs' => 'py3-appdirs',
	'py-argcomplete' => 'py3-argcomplete',
	'py-argh' => 'py3-argh',
	'py-audio' => 'py3-audio',
	'py-axolotl-curve25519' => 'py3-axolotl-curve25519',
	'py-backcall' => 'py3-backcall',
	'py-biplist' => 'py3-biplist',
	'py-bitstring' => 'py3-bitstring',
	'py-blessings' => 'py3-blessings',
	'py-blist' => 'py3-blist',
	'py-bsddb3' => 'py3-bsddb3',
	'py-cairocffi' => 'py3-cairocffi',
	'py-cffi' => 'py3-cffi',
	'py-characteristic' => 'py3-characteristic',
	'py-cheetah' => 'py3-cheetah',
	'py-clint' => 'py3-clint',
	'py-colored' => 'py3-colored',
	'py-configobj' => 'py3-configobj',
	'py-cooldict' => 'py3-cooldict',
	'py-cssutils' => 'py3-cssutils',
	'py-cstruct' => 'py3-cstruct',
	'py-cymruwhois' => 'py3-cymruwhois',
	'py-daemonize' => 'py3-daemonize',
	'py-decorator' => 'py3-decorator',
	'py-defusedxml' => 'py3-defusedxml',
	'py-demjson' => 'py3-demjson',
	'py-dicttoxml' => 'py3-dicttoxml',
	'py-discid' => 'py3-discid',
	'py-dispatcher' => 'py3-dispatcher',
	'py-dnslib' => 'py3-dnslib',
	'py-docopt' => 'py3-docopt',
	'py-easyprocess' => 'py3-easyprocess',
	'py-entrypoints' => 'py3-entrypoints',
	'py-filebytes' => 'py3-filebytes',
	'py-filelock' => 'py3-filelock',
	'py-flaky' => 'py3-flaky',
	'py-flexmock' => 'py3-flexmock',
	'py-frozendict' => 'py3-frozendict',
	'py-gitdb' => 'py3-gitdb',
	'py-greenlet' => 'py3-greenlet',
	'py-ipython_genutils' => 'py3-ipython_genutils',
	'py-iso3166' => 'py3-iso3166',
	'py-iso639' => 'py3-iso639',
	'py-isodate' => 'py3-isodate',
	'py-isort' => 'py3-isort',
	'py-jellyfish' => 'py3-jellyfish',
	'py-jmespath' => 'py3-jmespath',
	'py-magic' => 'py3-magic',
	'py-markdown' => 'py3-markdown',
	'py-mccabe' => 'py3-mccabe',
	'py-minimock' => 'py3-minimock',
	'py-mox3' => 'py3-mox3',
	'py-msgpack' => 'py3-msgpack',
	'py-munch' => 'py3-munch',
	'py-nose-warnings-filters' => 'py3-nose-warnings-filters',
	'py-nosexcover' => 'py3-nosexcover',
	'py-odbc' => 'py3-odbc',
	'py-olefile' => 'py3-olefile',
	'py-pandocfilters' => 'py3-pandocfilters',
	'py-parallel' => 'py3-parallel',
	'py-pathspec' => 'py3-pathspec',
	'py-pbkdf2' => 'py3-pbkdf2',
	'py-peewee' => 'py3-peewee',
	'py-phonenumbers' => 'py3-phonenumbers',
	'py-pickleshare' => 'py3-pickleshare',
	'py-progress' => 'py3-progress',
	'py-progressbar' => 'py3-progressbar',
	'py-pyprof2calltree' => 'py3-pyprof2calltree',
	'py-pyte' => 'py3-pyte',
	'py-rencode' => 'py3-rencode',
	'py-robotframework' => 'py3-robotframework',
	'py-rfc6555' => 'py3-rfc6555',
	'py-send2trash' => 'py3-send2trash',
	'py-setuptools_scm_git_archive' => 'py3-setuptools_scm_git_archive',
	'py-setuptools_trial' => 'py3-setuptools_trial',
	'py-sh' => 'py3-sh',
	'py-simpleeval' => 'py3-simpleeval',
	'py-simplegeneric' => 'py3-simplegeneric',
	'py-smmap' => 'py3-smmap',
	'py-socks' => 'py3-socks',
	'py-sql' => 'py3-sql',
	'py-stdnum' => 'py3-stdnum',
	'py-straight.plugin' => 'py3-straight.plugin',
	'py-test-expect' => 'py3-test-expect',
	'py-test-forked' => 'py3-test-forked',
	'py-test-relaxed' => 'py3-test-relaxed',
	'py-test-subtesthack' => 'py3-test-subtesthack',
	'py-testpath' => 'py3-testpath',
	'py-tld' => 'py3-tld',
	'py-tox' => 'py3-tox',
	'py-uv' => 'py3-uv',
	'py-vcversioner' => 'py3-vcversioner',
	'py-voluptuous' => 'py3-voluptuous',
	'py-wrapt' => 'py3-wrapt',
	'py-wstools' => 'py3-wstools',
	'py-xcbgen' => 'py3-xcbgen',
	'py-xlsxwriter' => 'py3-xlsxwriter',
	'py-yamllint' => 'py3-yamllint',
	'py-yapf' => 'py3-yapf',
	'py-sqlalchemy' => 'py3-sqlalchemy',
	'py-flup' => 'py3-flup',
	'py-feedparser' => 'py3-feedparser',
	'apertium-af-nl' => 'apertium-afr-nld',
	'apertium-ca-it' => 'apertium-cat-ita',
	'apertium-en-ca' => 'apertium-eng-cat',
	'apertium-es-ast' => 'apertium-spa-ast',
	'apertium-es-ca' => 'apertium-spa-cat',
	'apertium-id-ms' => 'apertium-ind-zlm',
	'apertium-is-en' => 'apertium-isl-eng',
	'apertium-is-sv' => 'apertium-isl-swe',
	'apertium-mk-bg' => 'apertium-mkd-bul',
	'apertium-mk-en' => 'apertium-mkd-eng',
	'apertium-pt-ca' => 'apertium-por-cat',
	'pinentry-gtk2' => 'pinentry-gnome3',
	'sxiv' => 'nsxiv',
	'geoclue' => 'geoclue2',
	'py-extras' => 'py3-extras',
	'py-fixtures' => 'py3-fixtures',
	'py-pbr' => 'py3-pbr',
	'py-testtools' => 'py3-testtools',
	'py-pyusb' => 'py3-pyusb',
	'py-atomicwrites' => 'py3-atomicwrites',
	'py-attrs' => 'py3-attrs',
	'py-coverage' => 'py3-coverage',
	'py-dateutil' => 'py3-dateutil',
	'py-freezegun' => 'py3-freezegun',
	'py-hypothesis' => 'py3-hypothesis',
	'py-more-itertools' => 'py3-more-itertools',
	'py-pluggy' => 'py3-pluggy',
	'py-py' => 'py3-py',
	'py-test' => 'py3-test',
	'py-test-benchmark' => 'py3-test-benchmark',
	'py-test-cov' => 'py3-test-cov',
	'py-test-mock' => 'py3-test-mock',
	'py-test-runner' => 'py3-test-runner',
	'py-setuptools_scm' => 'py3-setuptools_scm',
	'ssvnc-viewer' => 'tigervnc',
	'py-tz' => 'py3-tz',
	'py-pretend' => 'py3-pretend',
	'py-mock' => 'py3-mock',
	'gmic-qt-krita' => 'krita-gmic-plugin',
# 7.2
	'tracker-miners' => 'tracker3-miners',
	'tracker' => 'tracker3',
	'libgweather' => 'libgweather4',
	'spidermonkey78' => 'spidermonkey91',
	'gmime' => 'gmime30',
	'fcitx-pinyin' => 'fcitx-chinese-addons',
	'py-quixote' => 'py3-quixote',
	'py-requests' => 'py3-requests',
	'py-chardet' => 'py3-chardet',
	'chrome-gnome-shell' => 'gnome-browser-connector',
	'tdesktop-qt6' => 'tdesktop',
	'blocksruntime' => 'libdispatch',
	'py-mongo' => 'py3-mongo',
	'py-wheel' => 'py3-wheel',
	'py-idna' => 'py3-idna',
	'py-urllib3' => 'py3-urllib3',
	'py-packaging' => 'py3-packaging',
	'py-certifi' => 'py3-certifi',
	'py-ecdsa' => 'py3-ecdsa',
	'py-virtualenv' => 'py3-virtualenv',
	'webkitgtk4' => 'webkitgtk40',
	'py-llvmlite' => 'py3-llvmlite',
	'py-dpkt' => 'py3-dpkt',
	'py-dbus' => 'py3-dbus',
	'dspy' => 'd-spy',
	'i3-mousedrag' => 'i3',
# 7.3
	'spidermonkey91' => 'spidermonkey102',
	'dleyna-core' => 'dleyna',
	'gnome-todo' => 'endeavour',
	'go-ipfs' => 'kubo',
	'py-zc-lockfilezc.lockfile' => 'py3-zc-lockfile',
	'py3-zc-lockfilezc.lockfile' => 'py3-zc-lockfile',
	'py-elfesteem' => 'py3-miasm', # merged
	'py-miasm' => 'py3-miasm',
	'py-cssselect' => 'py3-cssselect',
	'py-cparser' => 'py3-cparser',
	'py-authres' => 'py3-authres',
	'py-policyd-spf' => 'py3-policyd-spf',
	'py-spf' => 'py3-spf',
	'py-nose' => 'py3-nose',
	'py-xdg' => 'py3-xdg',
	'i3-gaps' => 'i3',
	'rebar' => 'rebar3',
	'gortr' => 'stayrtr',
	'py-wxPython' => 'py3-wxPython',
	'py-modulegraph' => 'py3-modulegraph',
	'py-psutil' => 'py3-psutil',
	'py-lxml' => 'py3-lxml',
	'py-pyglet' => 'py3-pyglet',
	'py-suds' => 'py3-suds',
	'py-serial' => 'py3-serial',
	'py3-wxPython-webkit' => 'py3-wxPython-webview',
	'wxWidgets-webkit' => 'wxWidgets-webview',
	'ring' => 'rust-ring',
# 7.4
	'aarch64-none-elf-gcc-linaro' => 'aarch64-none-elf-gcc',
	'arm-none-eabi-gcc-linaro' => 'arm-none-eabi-gcc',
	'py3-sabyenc' => 'py3-sabctools',
	'py-libdnet' => 'py3-libdnet',
	'scons-py2' => 'scons',
	'qxlsx' => 'qt5-qxlsx',
	'py-altgraph' => 'py3-altgraph',
	'pymodbus' => 'py3-pymodbus',
	'py-yaml' => 'py3-yaml',
	'kalendar' => 'merkuro',
# 7.5
	'py-reportlab' => 'py3-reportlab',
	'py-simplejson' => 'py3-simplejson',
	'oce' => 'opencascade',
	'spidermonkey102' => 'spidermonkey115',
	'endeavor' => 'endeavour',
	'py-cryptodome' => 'py3-cryptodome',
	'py-yara' => 'py3-yara',
	'py-pefile' => 'py3-pefile',
	'py-plugnplay' => 'py3-plugnplay',
	'py-tabulate' => 'py3-tabulate',
	'py-funcy' => 'py3-funcy',
	'py-intervaltree' => 'py3-intervaltree',
	'py-sortedcontainers' => 'py3-sortedcontainers',
	'py-future' => 'py3-future',
	'py-capstone' => 'py3-capstone',
	'iosevka-fixed-slab' => 'iosevka-slab',
	'py-six' => 'py3-six',
	'py-binaryornot' => 'py3-binaryornot',
	'py-cython' => 'py3-cython',
	'py-analyzemft' => 'py3-analyzemft',
	'llama' => 'walk',
	'py-setuptools-git' => 'py3-setuptools-git',
	'unison' => 'unison-gui',
	'sendxmpp' => 'go-sendxmpp',
	'libreddit' => 'redlib',
	'rebar3' => 'erl25-rebar3',
# 7.6
	'stalwart-cli' => 'stalwart-mail',
	'stalwart-jmap' => 'stalwart-mail',
	'stalwart-imap' => 'stalwart-mail',
	'stalwart-smtp' => 'stalwart-mail',
	'BlockZone' => 'blockzone',
	'tepl' => 'libgedit-tepl',
	'py3-pep517' => 'py3-pyproject_hooks',
	'web-eid-native-chrome' => 'web-eid-chrome',
	'kuserfeedback' => 'kf6-kuserfeedback',
	'kgamma5' => 'kgamma',
	'baloo-widgets-kf5' => 'kf6-baloo-widgets',
	'dolphin-kf5' => 'kf6-dolphin',
	'ffmpegthumbs-kf5' => 'kf6-ffmpegthumbs',
	'svgpart-kf5' => 'kf6-svgpart',
	'kdegraphics-thumbnailers-kf5' => 'kf6-kdegraphics-thumbnailers',
	'libkdegames-kf5' => 'kf6-libkdegames',
	'systemsettings-kf5' => 'kf6-systemsettings',
	'libkscreen-kf5' => 'kf6-libkscreen',
	'kdeplasma-addons-kf5' => 'kf6-kdeplasma-addons',
	'kaccounts-integration' => 'kf6-kaccounts-integration',
	'apertium-en-es' => 'apertium-eng-spa',
	'monitoring-plugins-samba' => 'monitoring-plugins',
	'extra-cmake-modules' => 'kf6-extra-cmake-modules',
	'breeze-icons' => 'kf6-breeze-icons',
	'py3-buildbot-react-console-view' => 'py3-buildbot-console-view',
	'py3-buildbot-react-waterfall-view' => 'py3-buildbot-waterfall-view',
	'py3-buildbot-react-waterfall-view' => 'py3-buildbot-waterfall-view',
	'py3-buildbot-www-react' => 'py3-buildbot-www',
# 7.7
	'libkomparediff2-kf5' => 'kf6-libkomparediff2',
	'tracker3' => 'tinysparql',
	'tracker3' => 'localsearch',
	'spidermonkey115' => 'spidermonkey128',
	'blas' => 'lapack',
	'cblas' => 'lapack',
	'kio-extras' => 'kf6-kio-extras',
	'py-rcsparse' => 'py3-rcsparse',
	'py3-jsonschema-spec' => 'py3-jsonschema-path',
	'kdepim-runtime-kf5' => 'kdepim-runtime',
	'kcron-kf5' => 'kcron',
	'dolphin-plugins-kf5' => 'dolphin-plugins',
	'audiocd-kio-kf5' => 'audiocd-kio',
	'py3-path.py' => 'py3-path',
	'gstreamer1-plugins-bad' => 'gst-plugins-bad',
	'gstreamer1-plugins-base' => 'gst-plugins-base',
	'gstreamer1-plugins-good' => 'gst-plugins-good',
	'gstreamer1-plugins-libav' => 'gst-libav',
	'gstreamer1-plugins-ugly' => 'gst-plugins-ugly',
	'libksane-kf5' => 'libksane',
	'marble-kf5' => 'marble',
	'ksanecore' => 'kf6-ksanecore',
	'libkcompactdisc-kf5' => 'kf6-libkcompactdisc',
	'c-icap-clamav' => 'c-icap-modules',
	'c-icap-urlcheck' => 'c-icap-modules',
# 7.8
	'coq' => 'rocq',
	'totem' => 'showtime',
	'py-numpy' => 'py3-numpy',
	'py-Pillow' => 'py3-Pillow',
	'py-opengl' => 'py3-opengl',
	'compton-conf' => 'picom-config',
	'minetest' => 'luanti',
	'qcoro-qt6' => 'qcoro',
	'libaccounts-qt6' => 'libaccounts-qt',
	'kdsoap-qt6' => 'kdsoap-qt',
	'spyder3' => 'spyder',
	'p5-URI-ws' => 'p5-URI',
	'llama-cpp' => 'llama.cpp',
};

my $obsolete_reason = {};
my $obsolete_regexp = [];
sub setup_obsolete_reason
{
	while (@_ >= 2) {
		my ($i, $stem) = (shift, shift);
		if (ref $stem eq 'Regexp') {
			push (@$obsolete_regexp, [$stem, $i]);
		} else {
			$obsolete_reason->{$stem} = $i;
		}
	}
}

# this list is put in the "wrong" order (index => stem) because we
# want to put regexps as well in there (see the terraform or hs entries
# for instance)
setup_obsolete_reason(
# 7.0
	3 => qr{^ruby26-},
	3 => 'mailpile',
	7 => 'p5-Geo-GDAL',
	3 => 'gnome-latex',
	3 => 'p5-Puppet-Tidy',
	6 => 'kf5-icons-baloo',
	3 => 'canto',
	6 => 'py-mini-amf',
	6 => 'py3-mini-amf',
	9 => 'qucs-s',
	3 => 'qt4',
	3 => 'qt4-examples',
	3 => 'qt4-html',
	3 => 'qt4-mysql',
	3 => 'qt4-postgresql',
	3 => 'qt4-sqlite2',
	3 => 'qt4-tds',
	1 => 'antlr3',
	6 => 'enigmail',
	6 => 'enigmail-seamonkey',
	4 => 'google-compute-engine',
	3 => 'bzr',
	3 => 'bzr-svn',
	6 => 'libvstr',
# 7.1
	0 => 'cue',
	13 => 'py-SOAPpy',
	13 => 'py-ao',
	13 => 'py-backports-abc',
	13 => 'py-backports-functools-lru-cache',
	13 => 'py-backports-lzma',
	13 => 'py-backports-shutil-get-terminal-size',
	13 => 'py-backports-ssl-match-hostname',
	13 => 'py-binplist',
	13 => 'py-bytecodeassembler',
	13 => 'py-cddb',
	13 => 'py-editdist',
	13 => 'py-efilter',
	13 => 'py-faulthandler',
	13 => 'py-fpconst',
	13 => 'py-functools32',
	13 => 'py-gdata',
	13 => 'py-guppy',
	13 => 'py-hachoir-core',
	13 => 'py-hachoir-metadata',
	13 => 'py-hachoir-parser',
	13 => 'py-jonpy',
	13 => 'py-jsonrpclib',
	13 => 'py-lzo',
	13 => 'py-milter',
	13 => 'py-monotonic',
	13 => 'py-mox',
	13 => 'py-mxDateTime',
	13 => 'py-pdf',
	13 => 'py-pyro',
	13 => 'py-pysha3',
	13 => 'py-python2-pythondialog',
	13 => 'py-recaptcha-client',
	13 => 'py-ruamel.ordereddict',
	13 => 'py-singledispatch',
	13 => 'py-storm',
	13 => 'py-subprocess32',
	13 => 'py-sybase',
	13 => 'py-symboltype',
	13 => 'py-xmlrunner',
	13 => 'py-xmpppy',
	13 => 'py-yenc',
	13 => 'py-zsi',
	3 => 'tilecache',
	13 => 'py-configparser',
	13 => 'py-decoratortools',
	13 => 'py-paste',
	13 => 'py-paste-deploy',
	13 => 'py-paste-script',
	13 => 'py-selectors2',
	13 => 'py-wsgiutils',
	13 => 'py-xml',
	13 => 'py-backports',
	3 => 'ORBit2',
	3 => 'libbonobo',
	3 => 'libgnome',
	3 => 'mono-gnome',
	3 => 'libbonoboui',
	3 => 'libgnomeui',
	3 => 'gtetrinet',
	3 => 'gtetrinet-themes',
	3 => 'grhino',
	3 => 'gbrainy',
	3 => 'gnome-vfs2',
	3 => 'gnome-mime-data',
	3 => 'libIDL',
	3 => 'chemical-mime-data',
	3 => 'gmfsk',
	13 => 'gmapcatcher',
	3 => 'childsplay',
	6 => 'py-texscythe',
	6 => 'py-sqlalchemy-migrate',
	6 => 'py3-sqlalchemy-migrate',
	13 => 'rawdog',
	13 => 'charm',
	0 => 'ktsuss',
	11 => 'apertium-ht-en',
	7 => 'pear-Auth',
	7 => 'pear-Auth-HTTP',
	7 => 'pear-Auth-SASL',
	7 => 'pear-Cache',
	7 => 'pear-Config',
	7 => 'pear-Console-Table',
	7 => 'pear-Date',
	7 => 'pear-Date-Holidays',
	7 => 'pear-Date-Holidays_Australia',
	7 => 'pear-Date-Holidays_Austria',
	7 => 'pear-Date-Holidays_Brazil',
	7 => 'pear-Date-Holidays_Chile',
	7 => 'pear-Date-Holidays_Croatia',
	7 => 'pear-Date-Holidays_Czech',
	7 => 'pear-Date-Holidays_Denmark',
	7 => 'pear-Date-Holidays_Discordian',
	7 => 'pear-Date-Holidays_EnglandWales',
	7 => 'pear-Date-Holidays_Finland',
	7 => 'pear-Date-Holidays_France',
	7 => 'pear-Date-Holidays_Germany',
	7 => 'pear-Date-Holidays_Iceland',
	7 => 'pear-Date-Holidays_Ireland',
	7 => 'pear-Date-Holidays_Italy',
	7 => 'pear-Date-Holidays_Japan',
	7 => 'pear-Date-Holidays_Netherlands',
	7 => 'pear-Date-Holidays_Norway',
	7 => 'pear-Date-Holidays_PHPdotNet',
	7 => 'pear-Date-Holidays_Portugal',
	7 => 'pear-Date-Holidays_Romania',
	7 => 'pear-Date-Holidays_Russia',
	7 => 'pear-Date-Holidays_SanMarino',
	7 => 'pear-Date-Holidays_Serbia',
	7 => 'pear-Date-Holidays_Slovenia',
	7 => 'pear-Date-Holidays_Spain',
	7 => 'pear-Date-Holidays_Sweden',
	7 => 'pear-Date-Holidays_Turkey',
	7 => 'pear-Date-Holidays_UNO',
	7 => 'pear-Date-Holidays_USA',
	7 => 'pear-Date-Holidays_Ukraine',
	7 => 'pear-Date-Holidays_Venezuela',
	7 => 'pear-File',
	7 => 'pear-File-Find',
	7 => 'pear-HTML-Page2',
	7 => 'pear-HTML-Select',
	7 => 'pear-HTML-Template_IT',
	7 => 'pear-HTTP',
	7 => 'pear-HTTP-Request',
	7 => 'pear-HTTP-WebDAV-Server',
	7 => 'pear-Log',
	7 => 'pear-MIME-Type',
	7 => 'pear-Mail',
	7 => 'pear-Mail-Mime',
	7 => 'pear-Mail-mimeDecode',
	7 => 'pear-Net-DNS',
	7 => 'pear-Net-DNS2',
	7 => 'pear-Net-IDNA2',
	7 => 'pear-Net-IMAP',
	7 => 'pear-Net-IPv4',
	7 => 'pear-Net-IPv6',
	7 => 'pear-Net-LDAP',
	7 => 'pear-Net-LDAP2',
	7 => 'pear-Net-SMTP',
	7 => 'pear-Net-Sieve',
	7 => 'pear-Net-Socket',
	7 => 'pear-Net-URL',
	7 => 'pear-Net-URL2',
	7 => 'pear-Net-URL_Mapper',
	7 => 'pear-SOAP',
	7 => 'pear-Services-Weather',
	7 => 'pear-Services-oEmbed',
	7 => 'pear-System-Command',
	7 => 'pear-Validate',
	7 => 'pear-XML-Parser',
	7 => 'pear-XML-RSS',
	7 => 'pear-XML-Serializer',
	7 => 'pear-XML-Tree',
	3 => 'luacrypto',
	13 => 'skytools',
	13 => 'pgloader',
	7 => 'php-markdown',
	7 => 'php-predis',
	5 => 'virtuoso',
	3 => 'upobsd',
	4 => 'waagent',
	3 => 'slim',
	3 => 'slim-themes',
	5 => 'ocaml-biniou',
	5 => 'ocaml-easy-format',
	5 => 'libdsm',
	8 => 'direvent',
	3 => 'climm',
	13 => 'spe',
	13 => 'py-Checker',
	3 => 'ssvnc',
	11 => 'netshot',
	13 => 'py-contextlib2',
	13 => 'py-linecache2',
	13 => 'py-traceback2',
	13 => 'py-unittest2',
	13 => 'py-pathlib',
	13 => 'py-pathlib2',
	6 => 'py3-pathlib',
	6 => 'py3-pathlib2',
	13 => 'py-ipaddress',
	13 => 'py-scandir',
	3 => 'd-feet',
# 7.2
	3 => qr{^ruby27-},
	3 => 'gnome-documents',
	3 => 'lumail',
	3 => 'kalarmcal',
	5 => 'gnats',
	3 => 'gnome-books',
	6 => 'go-bootstrap',
	13 => 'py-typing',
	6 => 'py-funcsigs',
	6 => 'py-statistics',
	13 => 'pyrex',
	3 => 'luasoldout',
	3 => 'honeyd',
	47 => 'totd',
	6 => 'py3-importlib_resources',
	3 => 'py3-uv',
	6 => 'py3-blist',
	6 => 'mlt',
	6 => 'mlt-gpl',
	6 => 'webvfx',
	6 => 'libXp',
	5 => 'gamin',
	6 => 'py-futures',
	0 => 'p5-Crypt-Serpent',
	5 => 'compiz-bcop',
	5 => 'ccsm',
	5 => 'compizconfig-python',
	5 => 'compiz',
	5 => 'libcompizconfig',
	5 => 'compiz-plugins-main',
	5 => 'usrsctp',
	0 => 'shapezio',
	3 => 'boar',
# 7.3
	3 => 'evolution-rss',
	3 => 'libgfbgraph',
	3 => 'gnome-online-miners',
	3 => 'libzapojit',
	3 => 'librest',
	3 => 'seahorse-sharing',
	14 => 'electron',
	5 => 'xalan-j',
	5 => 'opencdk',
	5 => 'klaxon',
	3 => 'sentinel',
	3 => 'sslScanner',
	5 => 'softhsm',
	1 => 'chntpw',
	5 => 'nbaudit',
	1 => 'despoof',
	51 => 'zebedee',
	3 => 'slurpie',
	1 => 'samdump2',
	1 => 'smbsniff',
	0 => 'fragroute',
	3 => 'ikeman',
	3 => 'libperseus',
	0 => 'hatchet',
	51 => 'ctunnel',
	3 => 'py-libpcap',
	3 => 'supybot',
	3 => 'dissy',
	1 => 'stm32loader',
	3 => 'tmda',
	3 => 'spambayes',
	13 => 'nmap-zenmap',
	0 => 'uucpd',
	6 => 'py-sqlite2',
	13 => 'py-ipaddr',
	3 => 'hlfl',
	6 => 'caribou',
	5 => 'riak',
	15 => 'rmilter',
	3 => 'gotweb',
	6 => 'go-net',
	6 => 'go-goptlib',
	0 => 'xco',
	6 => 'go-sys',
	6 => 'go-crypto',
	6 => 'go-ed25519',
	6 => 'go-siphash',
	6 => 'go-text',
	6 => 'cryptcat',
	6 => 'pilot-link',
	6 => 'jpilot',
	3 => 'midori',
	3 => 'pykaraoke',
	3 => 'sk1',
	0 => 'pgadmin3',
	3 => 'rapidsvn',
	0 => 'chbg',
	3 => 'wammu',
	3 => 'winwrangler',
	3 => 'gtkhotkey',
	3 => 'libwnck',
	6 => 'ap-utils',
	6 => 'kibana',
	6 => 'elasticsearch',
	3 => 'ogmrip',
	3 => 'shrip',
# 7.4
	3 => qr{^ruby30-},
	3 => 'compton',
	16 => 'depotdownloader',
	3 => 'residualvm',
	5 => 'p5-Test-Group',
	4 => 'thedarkmod',
	3 => 'qtav',
	3 => 'ruby31-mysql',
	3 => 'ruby32-mysql',
	3 => 'libquicktime',
	3 => 'gnome-twitch',
	5 => 'sfio',
	3 => 'parrot',
	3 => 'kfloppy',
	3 => 'py3-hypatia',
	1 => 'reprepro',
	5 => 'ocaml-pcre',
	1 => 'breeze-grub',
	3 => 'mldonkey',
	3 => 'monotone',
	3 => 'botan',
	3 => 'bg5ps',
	1 => 'libxcvt',
	1 => 'ocaml-camlp4',
	1 => 'ocaml-camlp5',
	3 => 'freetype',
	3 => 'freetype-doc',
	6 => 'ipcheck',
# 7.5
	3 => 'psi',
	3 => 'coccinella',
	13 => 'py-snack',
	5 => 'wxglade',
	57 => 'barony',
	3 => 'exa',
	6 => 'libgnomekbd',
	3 => 'xmlrpc-c',
	1 => 'pwntools',
	1 => 'floss',
	5 => 'py-enum34',
	5 => 'py-viv_utils',
	5 => 'py-vivisect',
	3 => 'irc',
	1 => 'volatility',
	3 => 'driconf',
	3 => 'GAMMApage',
	3 => 'comix',
	3 => 'hwsensorsbeat',
	3 => 'jailkit',
	13 => 'p5-sybperl',
	3 => 'xprobe2',
	3 => 'minbif',
	3 => 'atlas',
	3 => 'dicepassc',
	5 => 'py-parsing',
	3 => 'freehdl',
	3 => 'freetalk',
	2 => 'trojita',
	5 => 'birdfont',
	5 => 'libxmlbird',
	5 => 'py-m2r',
	64 => 'qsyncthingtray',
	3 => 'h2o',
	3 => 'smtube',
	3 => 'goldendict',
	13 => 'mkplaylist',
	1 => 'proteus',
	1 => qr{^tryton},
# 7.6
	3 => qr{^ruby31-},
	5 => 'py3-pyls-black',
	5 => 'py3-python-language-server',
	5 => 'py3-python-jsonrpc-server',
	3 => 'dvdrip',
	3 => 'subtitleripper',
	3 => 'transcode',
	3 => 'phonon-backend-gstreamer',
	0 => 'gone',
	3 => 'opensmtpd-extras',
	3 => 'opensmtpd-extras-mysql',
	3 => 'opensmtpd-extras-pgsql',
	3 => 'opensmtpd-extras-redis',
	13 => 'opensmtpd-extras-python',
	3 => 'pdf2djvu',
	3 => 'py3-fsb5',
	3 => 'khotkeys',
	3 => 'ksysguard',
	3 => 'php-weathermap',
	3 => 'boris',
	3 => 'pg_statsinfo',
	3 => 'pg_stats_reporter',
	3 => 'lightly',
	5 => 'sofia-sip',
	3 => 'pgfouine',
	6 => 'py3-backports-strenum',
	3 => 'vpnc',
	3 => 'seahorse-nautilus',
	3 => 'libcryptui',
	3 => 'gnome-screenshot',
	3 => 'libgnome-keyring',
	1 => 'fnaify',
	3 => 'adsuck',
	6 => 'p5-Net-ICQ2000',
	6 => 'vicq',
	3 => 'iaxclient',
	3 => 'iaxclient-tcl',
	3 => 'kguitar',
	6 => 'mftrace',
# 7.7
	3 => 'pavuk',
	13 => 'potamus',
	3 => 'fleet',
	3 => 'xml-security-c',
	3 => 'utox',
	3 => 'vino',
	3 => 'kipi-plugins',
	3 => 'knotes',
	3 => 'libkipi',
	3 => 'icli',
	3 => 'cheese',
	3 => 'libcheese',
	3 => 'telegram-purple',
	6 => 'gnome-initial-setup',
	3 => 'pcmanfm',
	3 => 'libfm',
	3 => qr{^nextcloud-(27|28|29)},
	3 => 'cvs20hg',
	3 => 'git-cvs',
	7 => 'py3-uncompyle6',
	6 => 'py-arsenic',
	3 => 'py3-setuptools_scm_git_archive',
	0 => 'burpsuite',
	7 => 'govc',
	7 => 'vcsim',
	5 => 'sqlite',
	3 => 'swish-e',
	3 => 'p5-SWISH-API',
	3 => 'akonadi-notes',
	3 => 'quictls',
	6 => 'py3-setuptools-git',
	11 => 'rpki-data',
	5 => 'pycha',
	10 => 'gotosocial',
	5 => 'xsd',
	4 => 'fastnetmon',
	3 => 'kross-interpreters-kf5',
	3 => 'py3-notmuch',
	3 => 'pop3d',
	3 => 'myrddin',
	3 => 'ksql',
	6 => 'py-elasticsearch-curator',
	6 => 'py-ipython_genutils',
# 7.8
	6 => 'gnome-video-effects',
	3 => 'gnome-dictionary',
	3 => 'gnome-photos',
	3 => 'tsung',
	3 => 'mysticmine',
	3 => 'fretsonfire',
	3 => 'py-lpsolve',
	12 => 'rcube-markasjunk2',
	12 => 'rcube-sieverules',
	3 => 'rcube-yubikey-plugin',
	3 => 'qjson',
	3 => 'mysql-utilities',
	5 => 'cdk',
	5 => 'libdazzle',
	5 => 'clutter-gst',
	3 => 'bruce',
	4 => 'icedtea-web',
	3 => 'ruby34-rgen',
	5 => 'libmusicbrainz',
	5 => 'libunique',
	3 => 'makefaq',
# 7.9
	3 => 'clamnailer',
	3 => 'clamav-unofficial-sigs',
	3 => 'forcedattack',
	3 => 'pathological',
	3 => 'pyganim',
	4 => 'renpy',
	5 => 'pygame_sdl2',
	3 => 'dynagen',
	3 => 'termshark',
	11 => 'py3-lief',
	1 => 'rdp',
	71 => 'mininet',
	6 => 'dovecot-fts-xapian',
);

# these should be pkgnames, there was some hope that pkg_add might later
# be able to act on these directly.
my $obsolete_suggestion = {
# 7.0
	'gotweb' => 'gotwebd',
	'compton' => 'picom',
	'qucs-s' => [qw(xschem kicad)],
# 7.1
	'tilecache' => 'mapproxy',
# 7.2
	'exa' => 'eza',
	'go-bootstrap' => 'go',
# 7.4
	'depotdownloader' => 'steamctl',
	'residualvm' => 'scummvm',
# 7.5
	'coccinella' => [qw(dino mcabber gajim pidgin)],
	'goldendict' => 'goldendict-ng',
	'psi' => [qw(dino mcabber gajim pidgin)],
# 7.6
	'opensmtpd-extras' => [qw(opensmtpd-table-ldap opensmtpd-table-passwd opensmtpd-table-socketmap opensmtpd-table-sqlite)],
	'opensmtpd-extras-mysql' => 'opensmtpd-table-mysql',
	'opensmtpd-extras-pgsql' => 'opensmtpd-table-postgresql',
	'opensmtpd-extras-redis' => 'opensmtpd-table-redis',
# 7.9
	'dovecot-fts-xapian' => 'dovecot-fts-flatcurve',
};

# reasons for obsolete packages
my $obsolete_message = {
	0 => "ancient software that doesn't work",
	1 => "no benefit to being packaged",
	2 => "no longer maintained and full of security holes",
	3 => "no longer maintained upstream",
	4 => "unmaintained port that was blocking other changes in ports",
	5 => "outdated and/or no longer required by other ports",
	6 => "no longer useful",
	7 => "removed in favor of using the language's package manager",
	8 => "crashes in many different ways at runtime",
	9 => "not working correctly",
	10 => "other OS suggested, or see https://docs.gotosocial.org/en/latest/advanced/builds/nowasm/",
	11 => "no longer packageable",
	12 => "use the alternative plugin distributed with roundcube instead (markasjunk, managesieve)",
	13 => "has a dependency on obsolete software",
	14 => "horrible ecosystem",
	15 => "use rspamd's internal milter support instead",
	16 => "dependencies for recent versions can't be met",
	47 => "DNS network daemon running as root and not using random source ports. use DNS64 support in unbound or isc-bind",
	51 => "no longer maintained upstream, consider using socat or SSH",
	57 => "frequent breakage with new versions, required openal audio backend has been orphaned for > 1 year",
	64 => "no longer maintained upstream, crashes when showing the Syncthing web interface, use a browser",
	71 => "stale fork, requires Python 2, wants long gone switch(4), example does nothing (may destroy existing interfaces)",
};

# ->is_base_system($handle, $state):
#	checks whether an existing handle is now part of the base system
#	and thus no longer needed.

sub is_base_system
{
	my ($self, $handle, $state) = @_;

	my $pkgname = $handle->pkgname;
	my $stem = OpenBSD::PackageName::splitstem($pkgname);

	my $test = $base_exceptions->{$stem};
	if (defined $test) {
		require File::Glob;
		if (defined File::Glob::bsd_glob($test)) {
			$state->say("Removing #1 (part of base system now)", 
			    $pkgname);
			return 1;
		} else {
			$state->say("Not removing #1, #2 not found", 
			    $pkgname, $test);
			return 0;
		}
	} else {
		return 0;
	}
}

# ->filter_obsolete(\@list)
# explicitly mark packages as no longer there. Remove them from the
# list of "normal" stuff.

sub filter_obsolete
{
	my ($self, $list, $state) = @_;
	my @in = @$list;
	$list = [];
	for my $pkgname (@in) {
		my $stem = OpenBSD::PackageName::splitstem($pkgname);
		my $reason = $obsolete_reason->{$stem};
		if (!defined $reason) {
			for my $o (@$obsolete_regexp) {
				if ($pkgname =~ m/$o->[0]/) {
					$reason = $o->[1];
					last;
				}
			}
		}
		my $suggestion = $obsolete_suggestion->{$stem};
		my @l = ();
		if (defined $reason) {
			push(@l, $obsolete_message->{$reason});
		}
		if (defined $suggestion) {
			if (ref($suggestion)) {
				$suggestion = join(', ', @$suggestion);
			}
			push(@l, $state->f("suggest #1", $suggestion));
		}
		if (@l > 0) {
			$state->say("Obsolete package: #1 (#2)", $pkgname, 
			    join(', ', @l));
		} else {
			push(@$list, $pkgname);
		}
	}
}


# ->tweak_search(\@s, $handle, $state):
#	tweaks the normal search for a given handle, in case (for instance)
#	of a stem name change.

sub tweak_search
{
	my ($self, $l, $handle, $state) = @_;

	if (@$l == 0 || !$l->[0]->can("add_stem")) {
		return;
	}
	my $stem = OpenBSD::PackageName::splitstem($handle->pkgname);
	$self->may_add_stems($l->[0], $stem, $state);
}

# ->may_add_stems($object, $stem, $state):
# 	may add stems to an object using $object->add_stem
#	based on a given stem.

sub may_add_stems
{
	my ($self, $object, $stem, $state) = @_;

	my $extra = $stem_extensions->{$stem};
	if (defined $extra) {
		if (ref $extra) {
			for my $e (@$extra) {
				$object->add_stem($e);
			}
		} else {
			$object->add_stem($extra);
		}
	}
}

# list of
#   cat/path => badspec
my $cve = {
	'archivers/brotli' => 'brotli-<1.0.9',
	'archivers/cabextract' => 'cabextract-<1.8',
	'archivers/libmspack' => 'libmspack-<0.8alpha',
	'archivers/lz4' => 'lz4-<1.9.3p0',
	'archivers/p5-Archive-Zip' => 'p5-Archive-Zip-<1.64',
	'audio/flac' => 'flac-<1.3.0p1',
	'databases/mariadb,-main' => 'mariadb-client-<10.3.22',
	'databases/mariadb,-server' => 'mariadb-server-<10.3.15',
	'databases/postgresql,-main' => 'postgresql-client-<10.6',
	'databases/postgresql,-server' => 'postgresql-server-<10.6',
	'databases/sqlite3' => 'sqlite3-<3.25.3',
	'devel/apache-ant' => 'apache-ant-<1.10.9',
	'devel/git,-main' => 'git-<2.35.2',
	'devel/git,-svn' => 'git-svn-<2.35.2',
	'devel/git,-x11' => 'git-x11-<2.35.2',
	'devel/jansson' => 'jansson-<2.14',
	'devel/jenkins/devel' => 'jenkins-<2.154',
	'devel/jenkins/stable' => 'jenkins-<2.138.4',
	'devel/libgit2/libgit2' => 'libgit2-<0.27.7',
	'devel/mercurial,-main' => 'mercurial-<4.5.3p1',
	'devel/mercurial,-x11' => 'mercurial-x11-<4.5.3p1',
	'devel/pcre' => 'pcre-<8.38',
	'devel/sdl2-image' => 'sdl2-image-<2.0.4',
	'editors/vim,-main' => 'vim-<8.1.1483',
	'games/gnuchess' => 'gnuchess-<6.2.9',
	'graphics/png' => 'png-<1.6.37',
	'graphics/tiff' => 'tiff-<4.0.4beta',
	'lang/php/7.1,-main' => 'php->7.1,<7.1.29',
	'lang/php/7.2,-main' => 'php->7.2,<7.2.18',
	'lang/php/7.3,-main' => 'php->7.3,<7.3.5',
	'lang/python/2.7,-main' => 'python->2.7,<2.7.16',
	'lang/python/3.7,-main' => 'python->3.7,<3.7.9',
	'lang/python/3.8,-main' => 'python->3.8,<3.8.8',
	'lang/python/3.9,-main' => 'python->3.9,<3.9.2',
	'lang/ruby/2.3,-main' => 'ruby-<2.3.8',
	'lang/ruby/2.4,-main' => 'ruby->2.4,<2.4.5p2',
	'lang/ruby/2.5,-main' => 'ruby->2.5,<2.5.5',
	'lang/ruby/2.6,-main' => 'ruby->2.6,<2.6.2',
	'mail/dovecot,-server' => 'dovecot-<2.3.10.1',
	'mail/exim,-main' => 'exim-<4.97', # ...at least
	'mail/isync' => 'isync-<1.4.4',
	'mail/mailman' => 'mailman-<2.1.30',
	'mail/p5-Mail-SpamAssassin' => 'p5-Mail-SpamAssassin-<3.4.4',
	'mail/roundcubemail' => 'roundcubemail-<1.3.8',
	'math/hdf5' => 'hdf5-<1.8.21',
	'multimedia/libquicktime' => 'libquicktime-<1.2.4p13',
	'net/curl' => 'curl-<7.65.0',
	'net/dhcpcd' => 'dhcpcd-<7.2.2',
	'net/dino' => 'dino-<0.2.1',
	'net/haproxy' => 'haproxy-<2.4.4',
	'net/icecast' => 'icecast-<2.4.4',
	'net/irssi' => 'irssi-<1.2.1',
	'net/isc-bind' => 'isc-bind-<9.16.3',
	'net/libssh' => 'libssh-<0.9.5',
	'net/libssh2' => 'libssh2-<1.8.2',
	'net/lldpd' => 'lldpd-<0.7.18p0',
	'net/miniupnp/miniupnpd' => 'miniupnpd-<2.3.0',
	'net/mosquitto' => 'mosquitto-<1.5.6',
	'net/ntp' => 'ntp-<4.2.8pl7',
	'net/openconnect' => 'openconnect-<8.10',
	'net/openvpn' => 'openvpn-<2.4.9',
	'net/powerdns,-main' => 'powerdns-<4.1.5',
	'net/powerdns,-mysql' => 'powerdns-mysql-<4.1.5',
	'net/powerdns,-pgsql' => 'powerdns-pgsql-<4.1.5',
	'net/powerdns_recursor' => 'powerdns-recursor-<4.3.1',
	'net/rsync' => 'rsync-<3.1.3p0',
	'net/samba,-main' => 'samba-<4.8.18',
	'net/tinc' => 'tinc-<1.0.35v0',
	'net/transmission,-gtk' => 'transmission-gtk-<2.84',
	'net/transmission,-main' => 'transmission-<2.84',
	'net/transmission,-qt' => 'transmission-qt-<2.84',
	'net/wget' => 'wget-<1.20.3',
	'net/wireshark,-gtk' => 'wireshark-gtk-<2.6.3',
	'net/wireshark,-main' => 'wireshark-<2.6.3',
	'net/wireshark,-text' => 'tshark-<2.6.3',
	'net/zeromq' => 'zeromq-<4.3.3',
	'net/znc' => 'znc-<1.7.3',
	'print/cups,-main' => 'cups-<1.7.4',
	'security/clamav' => 'clamav-<0.100.2',
	'security/libssh' => 'libssh-<0.9.4',
	'security/opensc' => 'opensc-<0.20.0',
	'security/openssl/1.1' => 'openssl-<1.1.1g',
	'security/polarssl' => 'mbedtls-<2.16.12',
	'security/sudo' => 'sudo-<1.8.31',
	'shells/bash' => 'bash-<4.3.27',
	'sysutils/ansible,-main' => 'ansible-<2.7.1',
	'sysutils/borgbackup/1.2' => 'borgbackup-<1.2.5',
	'sysutils/mcollective' => 'mcollective-<2.5.3',
	'sysutils/rclone' => 'rclone-<1.53.3',
	'sysutils/salt' => 'salt-<3002',
	'telephony/asterisk,-main' => 'asterisk-<13.23.1',
	'telephony/coturn' => 'turnserver-<4.5.1.2',
	'textproc/mdbook' => 'mdbook-<0.4.6',
	'www/apache-httpd,-main' => 'apache-httpd-<2.4.35',
	'www/bozohttpd' => 'bozohttpd-<20130711p0',
	'www/chromium' => 'chromium-<69.0.3497.100',
	'www/gitea' => 'gitea-<1.7.6',
	'www/hiawatha' => 'hiawatha-<10.8.4',
	'www/iridium' => 'iridium-<2018.5.67',
	'www/jupyter-notebook' => 'jupyter-notebook-<5.7.8',
	'www/jupyter-notebook,python3' => 'jupyter-notebook3-<5.7.8',
	'www/mozilla-firefox' => 'firefox-<62.0.2p0',
	'www/nginx' => 'nginx-<1.4.1',
	'www/p5-CGI-Application' => 'p5-CGI-Application-<4.50p0',
	'www/p5-Catalyst-Plugin-Static-Simple' => 'p5-Catalyst-Plugin-Static-Simple-<0.36',
	'www/privoxy' => 'privoxy-<3.0.31',
	'www/py-bottle' => 'py-bottle-<0.12.19',
	'www/py-bottle,python3' => 'py3-bottle-<0.12.19',
	'www/py-django/lts' => 'py-django-lts-<1.11.19',
	'www/py-django/stable' => 'py-django-<2.1.6',
	'www/py-requests' => 'py-requests-<2.20.0',
	'www/py-requests,python3' => 'py3-requests-<2.20.0',
	'www/py-urllib3' => 'py-urllib3-<1.26.5',
	'www/py-urllib3,python3' => 'py3-urllib3-<1.26.5',
	'www/ruby-rack,ruby24' => 'ruby24-rack-<2.0.6',
	'www/ruby-rack,ruby25' => 'ruby25-rack-<2.0.6',
	'www/tomcat/v7' => 'tomcat-<7.0.104',
	'www/tomcat/v8' => 'tomcat-<8.5.55',
	'www/tomcat/v9' => 'tomcat-<9.0.35',
	'www/webkitgtk4' => 'webkitgtk4-<2.20.5',
	'www/yt-dlp' => 'yt-dlp-<2023.11.16',
	'x11/gnome/gdm' => 'gdm-<3.28.3',
	'x11/rdesktop' => 'rdesktop-<1.8.4',
};
# please maintain sort order in above $cve list, future updates need to
# replace existing entries

for my $sub (qw(calendar http_post ldap odbc pgsql snmp speex tds)) {
	$cve->{"telephony/asterisk,-$sub"} = "asterisk-$sub-<13.23.1";
}

for my $sub (qw(apache cgi dbg bz2 curl dba gd gmp intl imap ldap mysqli
    odbc pcntl pdo_mysql pdo_odbc pdo_pgsql pdo_sqlite pgsql pspell
    shmop soap snmp sqlite3 pdo_dblib tidy xmlrpc xsl zip mysql
    sybase_ct mssql mcrypt)) {
	$cve->{"lang/php/7.1,-$sub"} = "php-$sub->7.1,<7.1.22";
	$cve->{"lang/php/7.2,-$sub"} = "php-$sub->7.2,<7.2.10";
}


# ->check_security($path)
#	return an insecure specification for the matching path
#	e.g., you should update.

sub check_security
{
	my ($self, $path) = @_;
	if (defined $cve->{$path}) {
		return $cve->{$path};
	} else {
		return undef;
	}
}

my $optional_tag = {
#	emacs => 'emacs-*|xemacs-*',
};

# -> is_optional_tag($tag)
#	return either undef or a pkgspec where to find the definition

sub is_optional_tag
{
	my ($self, $tag) = @_;
	return $optional_tag->{$tag->name};
}

# doesn't do anything yet, but will be used to check consistency eventually
sub sanity_check
{
	my $self = shift;
	my $rc = 0;
	my $pointed;
	while (my ($k, $v) = each %$obsolete_reason) {
		if (!defined $obsolete_message->{$v}) {
			print STDERR "$k points to $v with no message\n";
			$rc = 1;
		}
		$pointed->{$v} = 1;
	}
	# XXX until we merge regexps
	$pointed->{21} = 1;
	while (my ($k, $v) = each %$obsolete_message) {
		if (!$pointed->{$k}) {
			print STDERR "Message key $k ($v) is unused\n";
			$rc = 1;
		}
	}
	exit $rc if $rc;
}

1;
