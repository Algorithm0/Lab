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
        height: parent.height - animation.height + animation.height * 0.3
        anchors.top: animation.bottom
        anchors.topMargin: - animation.height * 0.2
        radius: 70

        Text {
            id: titleText
            text: qsTr("Чем хотите заняться?")
            font.family: "Segoe UI Semibold"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: parent.width * 0.08
            color: colorTh.contr
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.02
            anchors.horizontalCenter: parent.horizontalCenter
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

    ListModel {
        id: modelView2
        ListElement {
            number: 1
            title: qsTr("Игра \"Работы мышления\"")
        }
        ListElement {
            number: 2
            title: qsTr("Игра \"Измени мышление\"")
        }
        ListElement {
            number: 3
            title: qsTr("Терапия удовольствием")
        }
        ListElement {
            number: 4
            title: qsTr("Релаксация")
        }
    }

    Component {
        id: componentView2

        Item {
            height: butComponent * 1.2
            width: panel.width * 0.8
            //anchors.horizontalCenter: viewSettingListView.horizontalCenter

            Button {
                id: butComponent
                text: title
                height: width * 0.2
                width: parent.width
                //anchors.centerIn: parent
                onClicked: {
                    panel.clicked(number)
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
                    font.pixelSize: butComponent.height * 0.3
                    width: butComponent.width * 0.8
                    font.family: "Segoe UI Semilight"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
    }

    signal clicked(int num)

}
