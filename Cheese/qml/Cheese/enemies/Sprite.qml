import QtQuick 1.1

Rectangle {
    property int index: 0
    property string spriteState: ""
    property variant spriteStates: {'':[]}

    color: spriteStates[spriteState][index]

    signal ticked()

    function tick() {
        index = (index + 1) % spriteStates[spriteState].length;
        ticked();
    }
}