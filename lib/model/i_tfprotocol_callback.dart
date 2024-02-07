abstract interface class ITfprotocolCallback{
  void statusServer(String value);
  void echoCallback(String value);
  void supCallback(String value);
  void fstatCallback(String value);
  void renamCallback(String value);
}