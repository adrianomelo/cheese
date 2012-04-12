import QtQuick 1.1

Image {
    property int type: 0

    source: type ? ("images/hole" + type + ".png") : ""
}
