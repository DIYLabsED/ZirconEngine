class GenericLogger{
  
  private File _logFile; 
  private PrintWriter _writer;
  private String _loggerName;
  
  private final String _fieldStart = "[ ";
  private final String _fieldEnd = " ]";
  private final String _dateSeperator = "/";
  private final String _timeSeperator = ":";
  private final String _dateTimeSeperator = " | ";
  
  final String TAG_LOG = "LOG";
  final String TAG_WRN = "WRN";
  final String TAG_ERR = "ERR";
    
  GenericLogger(File f, String name){
     
    if(f.isDirectory()){      
      throw new IllegalArgumentException("Directory passed to constructor. Pass a file instead.");      
    }
    
    else{     
      _logFile = f;      
    }
    
    
    if(name == ""){      
      throw new IllegalArgumentException("Logger name cannot be blank;");      
    }
    
    else{     
      _loggerName = name;      
    }
    
    
    try{
      _writer = new PrintWriter(_logFile);
    }
    catch(Exception e){
      e.printStackTrace();
    }
         
  }
   
  void finish(){
   
    _writer.flush();
    _writer.close();
    
  }
  
  void log(String tag, String msg){
    
    String log = "";
        
    log += _fieldStart;
    log += _getFormattedDateTime();
    log += _fieldEnd;
    
    log += _fieldStart;
    log += _loggerName;
    log += _fieldEnd;
    
    log += _fieldStart;
    log += tag;
    log += _fieldEnd;
    
    log += _fieldStart;
    log += msg;
    log += _fieldEnd;
    
    _writer.println(log);
    
  }
  
  private String _getFormattedDateTime(){
     
    String out = "";
    
    out += year();
    out += _dateSeperator;
    out += month();
    out += _dateSeperator;
    out += day();

    out += _dateTimeSeperator;
    
    out += hour();
    out += _timeSeperator;
    out += minute();
    out += _timeSeperator;
    out += second();
    out += _timeSeperator;
    out += millis();

    return out;
    
  }
  
}
