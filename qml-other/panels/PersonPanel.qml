import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
    id: personPanel

    Image {
        id: avatar
        source: "qrc:/resources/" + colorTh.icon_dir + "/avatar.png"
        width: parent.width * 0.25
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.06
        height: width
        fillMode: Image.PreserveAspectFit
    }

    Text {
        id: helloText
        text: qsTr("Здравствуйте!")
        font.family: "Segoe UI Semibold"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: parent.width * 0.08
        color: colorTh.contr
        anchors.top: avatar.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: helloText2
        text: qsTr("")
        font.family: "Segoe UI Semibold"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: parent.width * 0.05
        color: colorTh.contr
        anchors.top: helloText.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

    function timeChanged() {
        var h = (new Date).getHours()
        if (h >= 0 && h < 6)
        {
            helloText.text = qsTr("Доброй ночи!")
            helloText2.text = qsTr("Постарайтесь соблюдать\nрежим сна")
        }
        else if (h >= 6 && h < 11)
        {
            helloText.text = qsTr("Доброго утра!")
            helloText2.text = qsTr("Начните день\n с позитивных мыслей")
        }
        else if (h >= 11 && h < 18)
        {
            helloText.text = qsTr("Доброго Вам дня!")
            helloText2.text = qsTr("Будьте продуктивны\n")
        }
        else
        {
            helloText.text = qsTr("Добрый вечер!")
            helloText2.text = qsTr("Вспомните, что позитивного\nбыло за день")
        }
    }

    Timer {
        interval: 3600000; running: true; repeat: true;
        onTriggered: timeChanged()
    }

    ListModel {
        id: modelView
        ListElement {
            num: 1
            title: qsTr("Что такое депрессия?")
        }
        ListElement {
            num: 2
            title: qsTr("Тест Вашего состояния")
        }
        ListElement {
            num: 3
            title: qsTr("Дневник мыслей")
        }
        ListElement {
            num: 4
            title: qsTr("Помощь специалиста")
        }
        ListElement {
            num: 5
            title: qsTr("Темные цвета")
        }
        ListElement {
            num: 6
            title: qsTr("О приложении")
        }
    }

    Component {
        id: componentView

        Item {
            id: itemElemSetting
            width: parent.width
            height: titleText.font.pixelSize * 2

            Text {
                id: titleText
                text: title
                font.family: "Segoe UI Semilight"
                font.italic: true
                verticalAlignment: Text.AlignBottom
                font.pixelSize: parent.width * 0.05
                color: colorTh.contrC
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.05
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    personPanel.clicked(index)
                }
            }
        }
    }

    signal clicked(int num)

    ListView {
        clip: true
        id: viewSettingListView
        anchors.top: helloText2.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.width * 0.10 * modelView.count
        width: parent.width
        model: modelView
        delegate: componentView
        interactive: false
        anchors.topMargin: parent.width * 0.05
    }

    Switch {
        id: switchTheme
        width: height * 2.8
        height: parent.width * 0.05
        anchors.right: parent.right
        anchors.bottom: viewSettingListView.bottom
        anchors.bottomMargin: parent.width * 0.1 + height * 0.5
        anchors.rightMargin: parent.width * 0.05
        checked: colorTh.state == "black"
        onToggled: {
            if (!checked)
                colorTh.changeTheme("white")
            else
                colorTh.changeTheme("black")
        }
        indicator: Rectangle {
            width: switchTheme.width
            height: switchTheme.height
            anchors.centerIn: switchTheme
            radius: height/2
            color: switchTheme.checked ? colorTh.contr : colorTh.base_ext
            border.color: colorTh.contrC

            Rectangle {
                x: switchTheme.checked ? parent.width - width : 0
                anchors.verticalCenter: parent.verticalCenter
                width: height
                height: switchTheme.height * 1.5
                radius: height/2
                color: colorTh.contrC
            }
        }
    }

    state: "active"

    states: [
        State {
            name: "deactive"
            AnchorChanges {
                target: personPanel
                anchors.right: container.left
            }
        },

        State {
            name: "active"
            AnchorChanges {
                target: personPanel
                anchors.right: container.right
            }
        }
    ]

    transitions: Transition {
            AnchorAnimation {
                id: floating
                duration: 100
            }
    }

    Component.onCompleted: {
        timeChanged()
    }

}
