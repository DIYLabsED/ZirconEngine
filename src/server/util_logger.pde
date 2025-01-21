// Generic logging utility
// Written by DIY Labs

class GenericLogger{
  
  private File _logFile; 
  private PrintWriter _writer;
  private final String _internalName = "GenericLogger"; // External logs are not allowed to use name that matches this
  
  private final String _fieldStart = "[ ";
  private final String _fieldEnd = " ]";
  private final String _dateSeperator = "/";
  private final String _timeSeperator = ":";
  private final String _dateTimeSeperator = " | ";
  
  private boolean _writerClosed = false;
  
  // Provided for convenience, you're welcome
  public final String TAG_LOG = "LOG";  
  public final String TAG_WRN = "WRN";
  public final String TAG_ERR = "ERR";
    
  public GenericLogger(File f){
     
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
   
  public void finish(){
   
    _log(TAG_LOG, _internalName, "Flushing output and closing file");
    
    _writer.flush();
    _writer.close();
    
    _writerClosed = true;
    
  }
  
  public void log(String tag, String name, String msg){
    
    if(name == _internalName){
     throw new IllegalArgumentException("Cannot write to log using same name as logger"); 
    }
    
      _log(tag, name, msg);

  }
  
  private void _log(String tag, String name, String msg){
    
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
  
  private String _getFormattedDateTime(){ // TODO: Possibly add more date formats, currently uses YYYYMMDD 
     
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
