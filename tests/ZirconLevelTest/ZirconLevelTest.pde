import java.io.File;
import java.util.ArrayList;

 
ZirconLogger logger;

ArrayList<String> filePaths = new ArrayList<String>();
ArrayList<String> levelFiles = new ArrayList<String>();
ArrayList<String> elementFiles = new ArrayList<String>();
ArrayList<String> configFiles = new ArrayList<String>();


void setup() {
 
  ZirconLogger logger = new ZirconLogger(dataPath("log.log"));
  
  size(100, 100);
 
}


void loadFiles(File folder) {
  
  for (File file : folder.listFiles()){
    
    if (file.isDirectory()){
      
      loadFiles(file); 
        
    } 
    
    else {
      
    
    } 
      
  }
  
}
