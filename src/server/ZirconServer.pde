GenericLogger logger;

void setup(){
  
  File dir = new File(sketchPath("/data/debug.log"));
  String name = "ZirconEngine";
  
  logger = new GenericLogger(dir, name);

  logger.log(logger.TAG_LOG, "Log started");
  
  logger.finish();
  
}
