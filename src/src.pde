// File run by VSCode extension, used for testing purposes
// Can be safely removed for embedded use

// Written by DIY Labs
// Test

ZEGenericLogger logger;
ZEConfigParser parser;

public void setup(){

    logger = new ZEGenericLogger(new File(sketchPath("data/debug.log")));

    parser = new ZEConfigParser(new File(sketchPath("data")), logger);

    parser.initialise();

    parser.getNodesByName("testnode");

}

public void draw(){
    
}