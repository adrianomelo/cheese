import QtQuick 1.1

Item {
    id: root

    property int xOffset: 0
    property int yOffset: 0

    Image {
        x: (xOffset % sourceSize.width) - sourceSize.width
        y: (yOffset % sourceSize.height) - sourceSize.height
        width: root.width * 2 * Math.ceil(root.width / sourceSize.width)
        height: root.height * 2 * Math.ceil(root.height / sourceSize.height)
        fillMode: Image.Tile
        source: "images/bg.png"
    }
}
