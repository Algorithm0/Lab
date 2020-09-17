import QtQuick 2.12
import "./funcs"

Rectangle {
    id: smallMenu
    color: colorTh.base
    property int num_menu: 0

    states: [
        State {
            name: "closing"
            AnchorChanges {
                target: smallMenu
                anchors.right: container.left
            }
        },

        State {
            name: "showing"
            AnchorChanges {
                target: smallMenu
                anchors.right: container.right
            }
        }
    ]

    transitions: Transition {
        SequentialAnimation {

            ScriptAction {
                script: {
                    if (smallMenu.state == "closing")
                    {
                        bar.visible = true
                        personPanel.visible = true
                        toDoPanel.visible = true
                    }
                }
            }

            AnchorAnimation {
                id: floating
                duration: 100
            }

            ScriptAction {
                script: {
                    if (smallMenu.state == "showing")
                    {
                        bar.visible = false
                        personPanel.visible = false
                        toDoPanel.visible = false
                    }
                    else {
                        num_menu = 0
                    }
                }
            }
        }
    }

    function showMenu(num) {
        if (num >= -4 && num <= 5 && num != 4 && num != 0)
        {
            num_menu = num
            state = "showing"
        }
    }

    function hideMenu() {
        state = "closing"
    }

    state: "closing"

    NoReady {
        id: funcCont
        anchors.top: backBut.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width
        height: parent.height - (titleText.y + titleText.height)
        visible: num_menu > -4 && num_menu != 0 && num_menu < 5
    }

    MusicPlayer {
        id: funcMusic
        anchors.top: backBut.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width
        height: parent.height - (titleText.y + titleText.height)
        visible: num_menu == -4
    }

    AboutApp {
        id: funcAbout
        anchors.top: backBut.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width
        height: parent.height - (titleText.y + titleText.height)
        visible: num_menu == 5
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

    Image {
        id: backBut
        source: "qrc:/resources/" + colorTh.icon_dir + "/arrow-menu.png"
        width: parent.width * 0.14
        height: width
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: width * 0.3
        fillMode: Image.PreserveAspectFit

        MouseArea {
            anchors.fill: parent
            onClicked: {
                hideMenu()
            }
        }
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

    Component.onCompleted: {
        personPanel.clicked.connect(showMenu)
        toDoPanel.clicked.connect(showMenu)
    }


}
