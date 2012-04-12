// Game Engine

var cheeseStack = [];
var currentCheese = null;

var cheeseComponent = Qt.createComponent("Cheese.qml");
var holeComponent = Qt.createComponent("Hole.qml");

function nextLevel() {
    gameScene.currentLevel += 1;

    var cheese = cheeseComponent.createObject(world);
    if (cheeseStack.length >= 1) {
        var topCheese = cheeseStack[cheeseStack.length - 1];
        cheese.topBaseline = topCheese.y - topCheese.height + 60;
        cheese.z = topCheese.z - 1;
        gameScene.focusOn(topCheese);
    } else {
        cheese.topBaseline = 50;
    }

    cheese.fall();
    cheeseStack.push(cheese);
    // cheese.init(gameScene.currentLevel);
    cheese.init(1); // XXX: debug only
    currentCheese = cheese;
    cheese.gameOver.connect(gameScene.gameOver);
    cheese.timeUp.connect(nextLevel);

    return cheese;
}

function tick() {
    if (currentCheese)
        currentCheese.tick();
}

function reset() {
    for (var i in cheeseStack) {
        cheeseStack[i].destroy();
    }

    cheeseStack = [];
    currentCheese = null;
    gameScene.currentLevel = 0;
    gameScene.focusedItem = null;
}
