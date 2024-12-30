class GenericLogger{
  
  private File _logFile; 
  private PrintWriter _writer;
  private final String _internalName = "GenericLogger";
  
  private final String _fieldStart = "[ ";
  private final String _fieldEnd = " ]";
  private final String _dateSeperator = "/";
  private final String _timeSeperator = ":";
  private final String _dateTimeSeperator = " | ";
  
  private boolean _writerClosed = false;
  
  final String TAG_LOG = "LOG";
  final String TAG_WRN = "WRN";
  final String TAG_ERR = "ERR";
    
  GenericLogger(File f){
     
    if(f.isDirectory()){      
      throw new IllegalArgumentException("Directory passed to constructor. Pass a file instead");      
    }
    
    else{     
      _logFile = f;      
    }
    
    
    try{
      _writer = new PrintWriter(_logFile);
    }
    catch(Exception e){
      e.printStackTrace();
    }
         
  }
   
  void finish(){
   
    log(TAG_LOG, _internalName, "Flushing output and closing file");
    
    _writer.flush();
    _writer.close();
    
    _writerClosed = true;
    
  }
  
  void log(String tag, String name, String msg){
    
    if(_writerClosed){
     throw new IllegalStateException("Cannot write to file once closed"); 
    }
    
    String log = "";
        
    log += _fieldStart;
    log += _getFormattedDateTime();
    log += _fieldEnd;
    
    log += _fieldStart;
    log += name;
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
