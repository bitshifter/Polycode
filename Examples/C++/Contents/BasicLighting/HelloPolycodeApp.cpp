#include "HelloPolycodeApp.h"

HelloPolycodeApp::HelloPolycodeApp(PolycodeView *view) : EventHandler() {

#ifdef __APPLE__
	core = new CocoaCore(view, 640,480,false,0,90);	  
#else
	core = new SDLCore(view, 640,480,false,0,90);	  
#endif

	CoreServices::getInstance()->getResourceManager()->addArchive("Resources/default.pak");
	CoreServices::getInstance()->getResourceManager()->addDirResource("default", false);
	CoreServices::getInstance()->getResourceManager()->addDirResource("Resources", false);

	Scene *scene = new Scene();
	ScenePrimitive *ground = new ScenePrimitive(ScenePrimitive::TYPE_PLANE, 5,5);
	ground->setMaterialByName("GroundMaterial");
	scene->addEntity(ground);

	ScenePrimitive *box = new ScenePrimitive(ScenePrimitive::TYPE_TORUS, 0.8,0.3,30,20);
	box->setMaterialByName("CubeMaterial");
	box->setPosition(0.0, 0.5, 0.0);
	scene->addEntity(box);
	
	SceneLight *light = new SceneLight(SceneLight::AREA_LIGHT, scene, 5);
	light->setPosition(1,2,1);
	scene->addLight(light);

	scene->getDefaultCamera()->setPosition(7,7,7);
	scene->getDefaultCamera()->lookAt(Vector3(0,0,0));
}

bool HelloPolycodeApp::Update() {
    return core->Update();
}
