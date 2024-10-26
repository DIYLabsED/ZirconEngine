import java.io.File;
import java.util.ArrayList;


ArrayList<String> levelFiles = new ArrayList<String>();
ArrayList<String> elementFiles = new ArrayList<String>();


void setup() {
  
  String folderPath = dataPath("");
  scanFolder(new File(folderPath));
   
  println("Level files:");
  printArray(levelFiles.toArray());
  
  println("\nElement files:");
  printArray(elementFiles.toArray());
         
}

void scanFolder(File folder) {
  
  for (File file : folder.listFiles()){
    
    if (file.isDirectory()){
      
      scanFolder(file); 
        
    } 
    
    else {
      
      String extension = split(file.getAbsolutePath(), '.')[1];
            
      if(extension.contains("zlf")){
        levelFiles.add(file.getAbsolutePath());        
      }
      
      if(extension.contains("zef")){
        elementFiles.add(file.getAbsolutePath()); 
      }
      
    } 
      
  }
  
}
