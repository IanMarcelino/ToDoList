abstract class ExceptionGlobal implements Exception {
  final String message;
  final StackTrace? stackTrace;

  ExceptionGlobal(this.message, [this.stackTrace]);
  
  @override
  String toString() {
    if(stackTrace != null){
      return 'AppException: $message\n$stackTrace';
    } 
    return '$runtimeType: $message';
  }
}