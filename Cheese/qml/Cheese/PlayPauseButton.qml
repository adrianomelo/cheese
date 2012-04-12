import QtQuick 1.1

Rectangle {
    id: button

    signal clicked()

    width: 100
    height: 100
    color: "red"

    MouseArea {
        anchors.fill: parent
        onClicked: button.clicked();
    }
}
