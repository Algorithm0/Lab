import QtQuick 2.12
import "./funcs"

Rectangle {
    id: smallMenu
    color: colorTh.base
    property int num_menu: 0

    Image {
        id: backBut
        source: "qrc:/resources/" + colorTh.icon_dir + "/arrow-menu.png"
        width: parent.width * 0.14
        height: width
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: width * 0.3
        fillMode: Image.PreserveAspectFit

//        MouseArea {
//            anchors.fill: parent
//            onClicked: {
//                personPanel.state = "deactive"
//            }
//        }
    }

    Text {
        id: titleText
        text: getTitle(num_menu)
        font.family: "Segoe UI Semibold"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: parent.width * 0.07
        color: colorTh.contr
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: backBut.verticalCenter
    }

    NoReady {
        id: funcCont
        anchors.top: backBut.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width
        height: parent.height - (titleText.y + titleText.height)
        visible: true
    }


    function getTitle(i) {
        switch (i) {
        case -4: return qsTr("Релаксация")
        case -3: return qsTr("Терапия\nудовольствием")
        case -2: return qsTr("Измени\nмышление")
        case -1: return qsTr("Работы\nмышления")
        case 1: return qsTr("Тест\nсостояния")
        case 2: return qsTr("Дневник\nмыслей")
        case 3: return qsTr("Помощь\nспециалиста")
        case 5: return qsTr("О приложении")
        default: return qsTr("Неизвестный\nпункт")
        }
    }


}
