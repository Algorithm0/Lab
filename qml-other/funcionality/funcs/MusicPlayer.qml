import QtQuick 2.0
import QtMultimedia 5.12

Item {

    Text {
        id: sorryText
        text: qsTr("Постарайтесь расслабиться.\nПо возможности используйте\nнаушники и\nзакройте глаза")
        font.family: "Segoe UI Semibold"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: parent.width * 0.05
        color: colorTh.contr
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: height/5
    }

    Audio {
        id: playMusic
        onPlaying: {
            playBut.visible = false
            stopBut.visible = true
            animation.paused = false
        }
        onStopped: {
            if (userStoped) {
                playBut.visible = true
                stopBut.visible = false
            }
            else {
                source = randMusic()
                play()
            }
            animation.paused = true
        }
    }

    property bool userStoped: true

    Image {
        id: playBut
        source: "qrc:/resources/" + colorTh.icon_dir + "/play.png"
        width: parent.width * 0.14
        height: width
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit

        MouseArea {
            anchors.fill: parent
            onClicked: {
                userStoped = false
                playMusic.source = randMusic()
                playMusic.play()
            }
        }
    }

    Image {
        id: stopBut
        source: "qrc:/resources/" + colorTh.icon_dir + "/stop.png"
        width: parent.width * 0.14
        height: width
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit
        visible: false

        MouseArea {
            anchors.fill: parent
            onClicked: {
                userStoped = true
                playMusic.stop()
            }
        }
    }


    AnimatedImage {
        id: animation
        source: "qrc:/resources/music.gif"
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width
        fillMode: Image.PreserveAspectFit
        paused: true
    }

    Rectangle {
        color: colorTh.shadow
        anchors.fill: animation
        visible: colorTh.state == "black"
    }

    Rectangle {
        id: baseToDo
        color: colorTh.base
        width: parent.width
        height: animation.height * 0.4
        anchors.verticalCenter: animation.top
        anchors.horizontalCenter: parent.horizontalCenter
        radius: 50
        visible: colorTh.state == "black"
    }

    function randMusic () {
        var rd = Math.random()
        if (rd < 0.2)
            return "qrc:/resources/RelaxMusic/Enigma - Sadeness.mp3"
        else if (rd < 0.4)
            return "qrc:/resources/RelaxMusic/Ennio Morricone - Chi Mai.mp3"
        else if (rd < 0.6)
            return "qrc:/resources/RelaxMusic/James Last - The Lonely Shepherd.mp3"
        else if (rd < 0.8)
            return "qrc:/resources/RelaxMusic/Weathertunes - Sunny Day (Lemongrass Lazy Afternoon).mp3"
        else
            return "qrc:/resources/RelaxMusic/Weber - In This Dream.mp3"
    }

}
