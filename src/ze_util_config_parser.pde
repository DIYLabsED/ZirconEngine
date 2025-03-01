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

    public JSONObject[] getNodesOfName(String nodeName){

        ArrayList<JSONObject> nodeList = new ArrayList<JSONObject>();

        for(JSONObject node : nodes){

            if(node.hasKey(nodeName)){

                nodeList.add(node.getJSONObject(nodeName));
                _logger.log(_logger.TAG_LOG, "ZEConfigParser", "Found node: " + nodeName);

            }

        }

        return nodeList.toArray(new JSONObject[nodeList.size()]);

    }

    public JSONObject getSubnode(JSONObject node, String subnodeName){

        if(node.hasKey(subnodeName)){

            return node.getJSONObject(subnodeName);

        }
        else{

            _logger.log(_logger.TAG_ERR, "ZEConfigParser", "Subnode " + subnodeName + " not found in node " + node.toString());
            throw new IllegalArgumentException("Subnode " + subnodeName + " not found in node " + node.toString());

        }

    }

    public String getStringField(JSONObject node, String fieldName){

        if(node.hasKey(fieldName)){

            return node.getString(fieldName);

        }
        else{

            _logger.log(_logger.TAG_ERR, "ZEConfigParser", "Field " + fieldName + " not found in node " + node.toString());
            throw new IllegalArgumentException("Field " + fieldName + " not found in node " + node.toString());

        }

    }
    
    public int getIntField(JSONObject node, String fieldName){

        if(node.hasKey(fieldName)){

            return node.getInt(fieldName);

        }
        else{

            _logger.log(_logger.TAG_ERR, "ZEConfigParser", "Field " + fieldName + " not found in node " + node.toString());
            throw new IllegalArgumentException("Field " + fieldName + " not found in node " + node.toString());

        }

    }

    public float getFloatField(JSONObject node, String fieldName){

        if(node.hasKey(fieldName)){

            return node.getFloat(fieldName);

        }
        else{

            _logger.log(_logger.TAG_ERR, "ZEConfigParser", "Field " + fieldName + " not found in node " + node.toString());
            throw new IllegalArgumentException("Field " + fieldName + " not found in node " + node.toString());

        }

    }
    
    public boolean getBoolField(JSONObject node, String fieldName){

        if(node.hasKey(fieldName)){

            return node.getBoolean(fieldName);

        }
        else{

            _logger.log(_logger.TAG_ERR, "ZEConfigParser", "Field " + fieldName + " not found in node " + node.toString());
            throw new IllegalArgumentException("Field " + fieldName + " not found in node " + node.toString());

        }

    }
    
    public String[] getStringArrayField(JSONObject node, String fieldName){

        if(node.hasKey(fieldName)){

            return node.getJSONArray(fieldName).toStringArray();

        }
        else{

            _logger.log(_logger.TAG_ERR, "ZEConfigParser", "Field " + fieldName + " not found in node " + node.toString());
            throw new IllegalArgumentException("Field " + fieldName + " not found in node " + node.toString());

        }

    }
    
    public int[] getIntArrayField(JSONObject node, String fieldName){

        if(node.hasKey(fieldName)){

            return node.getJSONArray(fieldName).toIntArray();

        }
        else{

            _logger.log(_logger.TAG_ERR, "ZEConfigParser", "Field " + fieldName + " not found in node " + node.toString());
            throw new IllegalArgumentException("Field " + fieldName + " not found in node " + node.toString());

        }

    }

    public float[] getFloatArrayField(JSONObject node, String fieldName){

        if(node.hasKey(fieldName)){

            return node.getJSONArray(fieldName).toFloatArray();

        }
        else{

            _logger.log(_logger.TAG_ERR, "ZEConfigParser", "Field " + fieldName + " not found in node " + node.toString());
            throw new IllegalArgumentException("Field " + fieldName + " not found in node " + node.toString());

        }

    }
    
    public boolean[] getBoolArrayField(JSONObject node, String fieldName){

        if(node.hasKey(fieldName)){

            return node.getJSONArray(fieldName).toBooleanArray();

        }
        else{

            _logger.log(_logger.TAG_ERR, "ZEConfigParser", "Field " + fieldName + " not found in node " + node.toString());
            throw new IllegalArgumentException("Field " + fieldName + " not found in node " + node.toString());

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