
var lastCheese = null;
var currentCheese = null;

function nextLevel(scene, world)
{
    if (!scene)
        return;
    
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
    scene.currentLevel = scene.cheeseCount;
}

function restart(scene, world)
{
    for (var i=0; i < world.children.length; i++) {
        if (world.children[i].hp)
            world.children[i].destroy()
    }

    currentCheese = null;
    lastCheese = null;
    scene.cheeseCount = 0;
    scene.currentLevel = 1;
}
