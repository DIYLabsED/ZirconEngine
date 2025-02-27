// Util for loading JSON files from a directory
// Currently only supports JSON files. I don't think ZE needs custom file extensions

// Written by DIY Labs

class ZEConfigLoader{

    ArrayList<String> _filepaths = new ArrayList<String>();  // List of all files in the search directory
    File _searchDir;
    ZEGenericLogger _log;

    public ZEConfigLoader(File dir, ZEGenericLogger log){

        _log = log;
        
        if(dir.isDirectory()){
            _searchDir = dir;
        }
        else{
            throw new IllegalArgumentException("File passed to constructor. Pass a directory instead");
        }

        _log.log(_log.TAG_LOG, "ZEConfigLoader", "Created new instance of ZEConfigLoader, search directory: " + _searchDir.getAbsolutePath());

    }

    public void initialise(){

        _scanDirectory(_searchDir);

    }

    
    private void _scanDirectory(File dir){

        File[] files = dir.listFiles();

        for(File file : files){

            if(file.isDirectory()){

                _scanDirectory(file); 

            }
            else{

                if(file.getAbsolutePath().endsWith(".json")){ // Only JSON files allowed!

                    _filepaths.add(file.getAbsolutePath());
                    _log.log(_log.TAG_LOG, "ZEConfigLoader", "Found JSON file at: " + file.getAbsolutePath());
                    println(file.getAbsolutePath());

                }

            }

        }

    }

}