import QtQuick 1.1

Text {
    id: label

    signal clicked()

    text: "Game Over"
    color: "white"
    font.pixelSize: 56

    Behavior on opacity { NumberAnimation { duration: 500 } }

    MouseArea {
        anchors.fill: parent
        onClicked: label.clicked();
    }
}
