import QtQuick 2.0

Rectangle {
    id: window
    width: 360
    height: 360
    focus: true
    color: "#ffffee"

    Text {
        id: text1
        text: qsTr("Hello World")
        anchors.centerIn: parent
    }
}
