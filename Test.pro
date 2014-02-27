# Add more folders to ship with the application, here
Qml.source = qml/Test
Qml.target = qml
Ressources.source = res
Ressources.target = ./
Android.source = android
Android.target = ./
DEPLOYMENTFOLDERS = Qml Ressources Android

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    mainactivity.cpp \
    album.cpp \
    wtemp.cpp

# Installation path
# target.path =

# Please do not modify the following two lines. Required for deployment.
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

HEADERS += \
    mainactivity.h \
    album.h \
    wtemp.h

FORMS +=

OTHER_FILES += \
    res/images/Android-HD-Wallpapers-43.jpg \
    res/wallpaper/3d-hd.jpg \
    res/wallpaper/Beach wallpaper hd (1920 x 1200).jpg \
    res/wallpaper/Hdhut.blogspot.com (1).jpg \
    res/wallpaper/Yosemite-HD-2.jpg \
    res/wallpaper/Beach wallpaper hd (1920 x 1200).jpg \
    res/wallpaper/Hdhut.blogspot.com (1).jpg \
    res/wallpaper/HD/0000037-2650.jpg \
    res/wallpaper/HD/lion-hd-wallpaper-23 (1).jpg \
    res/downloads/728410-gt_mlb12theshow_vr_saa_hd.jpg \
    res/downloads/Florida+Marlins+v+Washington+Nationals+u07HD4y2lI7l.jpg \
    res/downloads/wallpaper/3d-hd.jpg \
    res/downloads/wallpaper/Beach wallpaper hd (1920 x 1200).jpg \
    res/downloads/wallpaper/Hdhut.blogspot.com (1).jpg \
    res/downloads/wallpaper/Yosemite-HD-2.jpg \
    res/downloads/wallpaper/HD/0000037-2650.jpg \
    res/downloads/wallpaper/HD/lion-hd-wallpaper-23 (1).jpg \
    res/downloads/wallpaper/HD/Wallpaper-HD.jpg \
    res/downloads/images/Android-HD-Wallpapers-43.jpg \
    res/pictures/fond-ecrab-hd-ipad-4.jpg \
    res/pictures/Prince-Fielder-MLB-Hd.jpg \
    android/AndroidManifest.xml \
    res/gallery.png \
    res/leftarrow.png \
    res/wtemp.png

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
