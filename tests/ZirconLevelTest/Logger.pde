// Handles data/error logging
// TODO: Generalise this so it can be used for other projects

class ZirconLogger{
 
  private PrintWriter _writer;
  
  private String _fieldStart = " [";
  private String _fieldEnd = "] ";
  
  private String _timeSeperator = ":";
  private String _dateSeperator = "/";
  
  public String PREFIX_LOG = "LOG";
  public String PREFIX_WRN = "WRN";
  public String PREFIX_ERR = "ERR";

  ZirconLogger(String fp){
      
    _writer = createWriter(fp);
    
    log("Logger created", PREFIX_LOG, "Logger");
      
  }
  
  public void log(String message, String prefix, String sender){
   
    String log = "";
    
    log += _fieldStart;
    log += prefix;
    log += _fieldEnd;
    
    log += _fieldStart;
    log += _formattedDate();
    log += _fieldEnd;
    
    log += _fieldStart;
    log += _formattedTime();
    log += _fieldEnd;
    
    log += _fieldStart;
    log += sender;
    log += _fieldEnd;
    
    log += _fieldStart;
    log += message;
    log += _fieldEnd;
    
    _writer.println(log);
    
  }
  
  public void flush(){
    
   _writer.flush();
   
  }
  
  public void close(){

    _writer.close();
    
  }
  
  public void safeExit(){
   
    log("Logger safe exit", PREFIX_LOG, "Logger");
    flush();
    close();
    
  }
  
  private String _formattedTime(){
    
    String s = "";
    
    s += hour();
    s += _timeSeperator;
    s += minute();
    s += _timeSeperator;
    s += second();    
    s += _timeSeperator;
    s += millis();    
    
    return s;
    
  }

  private String _formattedDate(){
    
    String s = "";
    
    s += year();
    s += _dateSeperator;
    s += month();
    s += _dateSeperator;
    s += day();
    
    return s;
    
  }

}
