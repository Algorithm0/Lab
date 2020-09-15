import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
    id: panel

    AnimatedImage {
        id: animation
        source: "qrc:/resources/relax.gif"
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width
        fillMode: Image.PreserveAspectFit
    }

    Rectangle {
        id: baseToDo
        color: colorTh.base
        width: parent.width
        height: parent.height - animation.height + animation.height * 0.15
        anchors.top: animation.bottom
        anchors.topMargin: - animation.height * 0.15
        radius: 50

        Text {
            id: titleText
            text: qsTr("Чем хотите заняться?")
            font.family: "Segoe UI Semibold"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: parent.width * 0.07
            color: colorTh.contr
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.02
            anchors.horizontalCenter: parent.horizontalCenter
        }

        ListModel {
            id: modelView2
            ListElement {
                // @disable-check M16
                number: 1
                // @disable-check M16
                title: qsTr("Игра \"Работы мышления\"")
            }
            ListElement {
                // @disable-check M16
                number: 2
                // @disable-check M16
                title: qsTr("Игра \"Измени мышление\"")
            }
            ListElement {
                // @disable-check M16
                number: 3
                // @disable-check M16
                title: qsTr("Терапия удовольствием")
            }
            ListElement {
                // @disable-check M16
                number: 4
                // @disable-check M16
                title: qsTr("Релаксация")
            }
        }

        Component {
            id: componentView2

            Item {
                height: width * 0.2
                width: panel.width

                Button {
                    id: butComponent
                    text: title
                    height: parent.height * 0.75
                    width: parent.width * 0.8
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                        panel.clicked(-1 * number)
                    }

                    background: Rectangle {
                        id: tecButDef
                        color: butComponent.pressed ? colorTh.base_ext : colorTh.contrC
                        radius: 10
                        height: butComponent.height
                        width: butComponent.width
                        anchors.centerIn: butComponent
                    }

                    contentItem: Text {
                        text: butComponent.text
                        color: colorTh.contr
                        anchors.fill: tecButDef
                        font.pixelSize: butComponent.height * 0.25
                        width: butComponent.width * 0.8
                        font.family: "Segoe UI Semilight"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
            }
        }

        ListView {
            //clip: false
            id: viewSettingListView
            anchors.top: titleText.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            height: parent.width * 0.192 * modelView2.count
            width: parent.width
            model: modelView2
            delegate: componentView2
            interactive: false
            anchors.topMargin: parent.width * 0.05
        }
    }

    signal clicked(int num)

}
