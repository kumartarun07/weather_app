class ApiException implements Exception
{
  String title;
  String msg;
  ApiException({required this.title,required this.msg});
  String toError()
  {
    return "$title:$msg";
  }
}

class FetchException extends ApiException{
  FetchException({required String errorMsg}):super(title: "Network Error",msg:errorMsg);
}

class BadRequestException extends ApiException{
  BadRequestException({required String errorMsg}):super(title: "Invalid request",msg: errorMsg);
}

class  UnauthorisedException extends ApiException{
  UnauthorisedException({required String errorMsg}):super(title: "Unauthorised",msg: errorMsg);
}

class InvalidInputException extends ApiException{
  InvalidInputException({required String errorMsg}):super(title: "Invalid User",msg: errorMsg);
}