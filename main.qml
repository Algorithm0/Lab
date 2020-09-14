import QtQuick 2.12
import QtQuick.Window 2.12
import "./qml-other/settings"
import "./qml-other/panels"

Window {
    id: root
    visible: true
    width: 1080/2.5
    height: 2340/2.5
    color: colorTh.base
    title: qsTr("Антидепрессия")

    ColorTheme {
        id: colorTh
    }

    SaveSet {
        id: setApp
    }

    Item {
        id: container
        width: parent.width
        height: parent.height

        PersonPanel {
            id: personPanel
            width: parent.width
            height: parent.height - bar.height
            anchors.top: parent.top
            state: "active"
        }

        ToDoPanel {
            id: toDoPanel
            width: parent.width
            height: parent.height - bar.height
            anchors.top: parent.top
            anchors.left: personPanel.right
        }

        Rectangle {
            id: bar
            height: parent.width * 0.12
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            color: colorTh.base_ext

            Image {
                id: avatarMenu
                source: personPanel.state != "active" ? "qrc:/resources/" + colorTh.icon_dir + "/avatar-off.png"
                                                      : "qrc:/resources/" + colorTh.icon_dir + "/avatar.png"
                width: parent.height * 0.8
                height: width
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: parent.width/5
                fillMode: Image.PreserveAspectFit

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        personPanel.state = "active"
                    }
                }
            }

            Image {
                id: toDoMenu
                source: personPanel.state != "deactive" ? "qrc:/resources/" + colorTh.icon_dir + "/ToDo-off.png"
                                                        : "qrc:/resources/" + colorTh.icon_dir + "/ToDo-on.png"
                width: avatarMenu.width
                height: width
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: parent.width/5
                fillMode: Image.PreserveAspectFit

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        personPanel.state = "deactive"
                    }
                }
            }
        }
    }
}
