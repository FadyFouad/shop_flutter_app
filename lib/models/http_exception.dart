///****************************************************
///*** Created by Fady Fouad on 13-Apr-20 at 16:54.***
///****************************************************

class HttpException implements Exception {
  final String errorMessage;

  HttpException(this.errorMessage);

  @override
  String toString() {
    return 'HttpException{errorMessage: $errorMessage}';
  }
}
