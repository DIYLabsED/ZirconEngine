GenericLogger logger;

void setup(){
  
  File dir = new File(sketchPath("/data/debug.log"));
  String name = "ZirconEngine";
  
  logger = new GenericLogger(dir);

  logger.log(logger.TAG_LOG, "engn", "Log started");
  
  logger.finish();

}
