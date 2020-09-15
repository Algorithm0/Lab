import QtQuick 2.0

Item {

    Text {
        id: sorryText
        text: qsTr("Упс! Этой функции еще пока нет.\nНе переживайте, мы скоро всё\nсделаем!\nЗаварите себе кружку\nкофе, пока мы работаем")
        font.family: "Segoe UI Semibold"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: parent.width * 0.05
        color: colorTh.contr
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: height/5
    }

    Image {
        id: name
        source: "qrc:/resources/coffe.png"
        width: parent.width * 0.4
        height: width
        anchors.top: sorryText.bottom
        anchors.topMargin: height * 0.1
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
    }
}
