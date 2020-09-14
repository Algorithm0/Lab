import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: Screen.width
    height: Screen.height
    title: qsTr("Hello World")

    Rectangle {
        anchors.centerIn: parent
        color: "red"
        width: parent.width/2
        height: width
    }
}
