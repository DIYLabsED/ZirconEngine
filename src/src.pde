// File run by VSCode extension, used for testing purposes
// Can be safely removed for embedded use

// Written by DIY Labs


ZEGenericLogger logger;
ZEConfigParser parser;

public void setup(){

    logger = new ZEGenericLogger(new File(sketchPath("data/debug.log")));

    parser = new ZEConfigParser(new File(sketchPath("data")), logger);

    parser.initialise();

    JSONObject[] testNodes = parser.getNodesOfName("testnode");

    JSONObject subtestnode = parser.getSubnode(testNodes[0], "subtestnode");

    println(parser.getStringField(testNodes[0], "string"));
    println(parser.getStringArrayField(testNodes[1], "stringarray"));
    println(parser.getStringField(subtestnode, "substring"));

}

public void draw(){
    
}