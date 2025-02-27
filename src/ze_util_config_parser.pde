// Util for loading JSON files from a directory
// Currently only supports JSON files. I don't think ZE needs custom file extensions

// Written by DIY Labs

/*  
        "testnode" : {                        <-- Node

            "string" : "string",              <-- Field

            "subnode" : {                     <-- Subnode

                "substring" : "substring"     <-- Subfield

            }

        }
*/

class ZEConfigParser{

    ArrayList<String> _filepaths = new ArrayList<String>(); 
    JSONObject nodes[];
    File _searchDir;
    ZEGenericLogger _logger;

    public ZEConfigParser(File dir, ZEGenericLogger logger){

        _logger = logger;
        
        if(dir.isDirectory()){
            _searchDir = dir;
        }
        else{
            throw new IllegalArgumentException("File passed to ZEConfigParser constructor. Pass a directory instead");
        }

        _logger.log(_logger.TAG_LOG, "ZEConfigParser", "Created new instance of ZEConfigParser, search directory: " + _searchDir.getAbsolutePath());

    }

    public void initialise(){

        _scanDirectory(_searchDir);
        nodes = _loadJSONObjects();

    }

    public ArrayList<String> getFilepaths(){

        return _filepaths;

    }

    public JSONObject[] getAllNodes(){

        return nodes;

    }

    public void getNodesByName(String nodeName){

        for(JSONObject node : nodes){

            if(node.hasKey(nodeName)){

                println("found " + nodeName);

            }

        }

    }
    
    private JSONObject[] _loadJSONObjects(){

        ArrayList<JSONObject> nodeList = new ArrayList<JSONObject>();

        for(String fp : _filepaths){

            JSONArray config = loadJSONArray(fp);

            for(int i = 0; i < config.size(); i++){

                nodeList.add(config.getJSONObject(i));

            }

        }

        return nodeList.toArray(new JSONObject[nodeList.size()]);

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
                    _logger.log(_logger.TAG_LOG, "ZEConfigLoader", "Found JSON file at: " + file.getAbsolutePath());
                    println(file.getAbsolutePath());

                }

            }

        }

    }

}