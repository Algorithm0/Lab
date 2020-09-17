import QtQuick 2.0

Item {

    Image {
        id: avatar
        source: "qrc:/resources/whiteTh/avatar.png"
        width: parent.width * 0.25
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: height * 0.2
        height: width
        fillMode: Image.PreserveAspectFit
    }

    Text {
        id: sorryText
        text: qsTr("Приложение \"Антидепрессия\"\nversion: 0.1\nРазработано в рамках уч. практики\nРазработчик:\nВоронцов Сергей")
        font.family: "Segoe UI Semibold"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: parent.width * 0.05
        color: colorTh.contr
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: avatar.bottom
        anchors.bottomMargin: height * 0.2
    }

    Image {
        id: git
        source: "qrc:/resources/" + colorTh.icon_dir + "/git.png"
        width: parent.width * 0.15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: sorryText.bottom
        anchors.topMargin: height * 0.2
        height: width
        fillMode: Image.PreserveAspectFit

        MouseArea {
            anchors.fill: parent
            onClicked: Qt.openUrlExternally("https://github.com/Algorithm0/Lab")
        }
    }

}
