// Set of functions for handling files (go figure)
// Maybe class-ify (heh!) in the future?

// For some reason, split()-ing fp, and ==-ing the first element with an extension would not work, so I'm using contains()         
// Best guess is something weird is happening with whitespace    
// in scanFolder()

ArrayList<String> levelFilePaths = new ArrayList<String>();
ArrayList<String> elementFilePaths = new ArrayList<String>();
ArrayList<String> configFilePaths = new ArrayList<String>();

ZirconLogger fh_logger; // *poke poke* class-ify this!!

void loadFiles(ZirconLogger zl){
 
  fh_logger = zl;
  
  scanFolder(new File(dataPath("")));
  
}

void scanFolder(File folder) {
  
  for (File file : folder.listFiles()){
    
    if (file.isDirectory()){
      
      scanFolder(file); 
        
    } 
    
    else {
      
      String fp = file.getAbsolutePath(); 
      String ex = split(fp, '.')[1];
      
      fh_logger.log("Found file at: " + fp + " with detected extension: " + ex, fh_logger.PREFIX_LOG, "FileHandler");
      
      if(ex.contains("zcfg")){ 
        
        configFilePaths.add(fp);    
        fh_logger.log("Loaded config file at: " + fp + " into ArrayList", fh_logger.PREFIX_LOG, "FileHandler");

      }
      
      if(ex.contains("zlmt")){
        
        elementFilePaths.add(fp);        
        fh_logger.log("Loaded element file at: " + fp + " into ArrayList", fh_logger.PREFIX_LOG, "FileHandler");

    }
      
      if(ex.contains("zlvl")){       
    
        levelFilePaths.add(fp);        
        fh_logger.log("Loaded level file at: " + fp + " into ArrayList", fh_logger.PREFIX_LOG, "FileHandler");

    }
      
    } 
      
  }
  
}
