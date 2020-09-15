import QtQuick 2.0
import Qt.labs.settings 1.1

Item {
    id: themeColor
    property color base: "black"
    property color base_ext: "#404040"
    property color contr: "#447C4F"
    property color contrC: "white"
    property color shadow: Qt.rgba(0, 0, 0, 0.5)
    property string icon_dir: "blackTh"

    state: colorThemesSet.selected

    Settings {
        id: colorThemesSet
        category: "color_theme"
        property string selected: "white"
    }

    states: [
        State {
            name: "black"
            PropertyChanges {
                target: themeColor
                base: "black"
                base_ext: "#404040"
                contr: "#447C4F"
                contrC: "white"
                shadow: Qt.rgba(0, 0, 0, 0.5)
                icon_dir: "blackTh"
            }
        },

        State {
            name: "white"
            PropertyChanges {
                target: themeColor
                base: "white"
                base_ext: "#C6C6C6"
                contr: "#005D77"
                contrC: "black"
                shadow: Qt.rgba(100, 100, 100, 0.5)
                icon_dir: "whiteTh"
            }
        }
    ]

    function changeTheme(_state)
    {
        colorThemesSet.selected = _state
        themeColor.state = _state
    }

    Component.onCompleted: {
        themeColor.state = colorThemesSet.selected
    }

}
