import QtQuick 1.1

Text {
    id: button
    signal clicked()

    text: "Start"
    font.pixelSize: 72
    color: "white"

    MouseArea {
        anchors.fill: parent
        onClicked: button.clicked();
    }
}
