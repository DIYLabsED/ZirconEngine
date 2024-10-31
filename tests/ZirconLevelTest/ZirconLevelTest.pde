import java.io.File;
import java.util.ArrayList;

 
ZirconLogger logger;


void setup() {
 
  ZirconLogger logger = new ZirconLogger("logs/main.log");
  
  loadFiles(logger);
  
  logger.safeExit();      
  
}
