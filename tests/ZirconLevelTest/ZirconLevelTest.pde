import java.io.File;
import java.util.ArrayList;

ArrayList<String> filepaths = new ArrayList<String>();

void setup() {
  
  String folderPath = dataPath("");
  scanFolder(new File(folderPath));
   
  printArray( filepaths.toArray());  
       
}

void scanFolder(File folder) {
  
  for (File file : folder.listFiles()) {
    
      if (file.isDirectory()) {
          scanFolder(file);  // Recursively scan subfolders
      } else {
          filepaths.add(file.getAbsolutePath());
      }
      
  }

}
