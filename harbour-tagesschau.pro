# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-tagesschau

CONFIG += sailfishapp

SOURCES += src/harbour-tagesschau.cpp

OTHER_FILES += qml/harbour-tagesschau.qml \
    qml/cover/CoverPage.qml \
    rpm/harbour-tagesschau.changes.in \
    rpm/harbour-tagesschau.spec \
    rpm/harbour-tagesschau.yaml \
    harbour-tagesschau.desktop \
    qml/pages/MainPage.qml \
    qml/pages/AboutPage.qml \
    qml/pages/InlandPage.qml \
    qml/pages/AuslandPage.qml \
    qml/pages/WirtschaftPage.qml \
    qml/pages/RegionalPage.qml \
    qml/pages/WetterPage.qml \
    qml/pages/KulturPage.qml \
    qml/pages/KontaktPage.qml \
    qml/pages/ImpressumPage.qml \
    harbour-tagesschau.png \
    harbour-tagesschau.svg \
    qml/pages/MenuePage.qml


