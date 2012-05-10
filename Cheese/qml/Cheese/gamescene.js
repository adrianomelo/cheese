
var lastCheese = null;
var currentCheese = null;

function nextLevel(scene, world)
{
    if (!scene)
        return;
    
    scene.currentLevel = scene.currentLevel + 1;
    lastCheese = currentCheese;
    
    if (lastCheese)
        lastCheese.running = false;

    currentCheese = cheeseUnit.createObject(world);
    currentCheese.x = (scene.width - currentCheese.width) * Math.random();
    currentCheese.y = scene.contentY - currentCheese.height;

    currentCheese.init(scene.currentLevel);
    currentCheese.running = true;

    currentCheese.z = 100 -scene.cheeseCount;
    scene.cheeseCount = scene.cheeseCount + 1;
}

function restart(scene, world)
{
    for (var i=0; i < world.children.length; i++) {
        if (world.children[i].player)
            world.children[i].destroy()
    }

    currentCheese = null;
    lastCheese = null;
    scene.cheeseCount = 0;
    scene.currentLevel = 0;
}
