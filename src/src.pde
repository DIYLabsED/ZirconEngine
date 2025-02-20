// File run by VSCode extension, used for testing purposes
// Can be safely removed for embedded use

// Written by DIY Labs

ZEGenericLogger logger;
ZEConfigLoader loader;


public void setup(){

    logger = new ZEGenericLogger(new File(sketchPath("data/debug.log")));
    loader = new ZEConfigLoader(new File(sketchPath("data")), logger);

    loader.initialise();

    logger.finish();


}

public void draw(){
    
}