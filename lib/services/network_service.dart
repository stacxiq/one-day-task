import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

class Network {
  String aToken = '';
  static final dio = Dio(
    BaseOptions(
      baseUrl: 'https://one-day-task.data-heros.com/v1/',
      receiveDataWhenStatusError: true,
    ),
  );

  static Future<void> initializeInterceptors() async {
    dio.interceptors.add(RetryInterceptor(
      dio: dio,
      logPrint: print,
      retryDelays: const [
        // set delays between retries (optional)
        Duration(seconds: 1), // wait 1 sec before first retry
        Duration(seconds: 2), // wait 2 sec before second retry
        Duration(seconds: 3), // wait 3 sec before third retry
      ],
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (request, handler) async {
        return handler.next(request); //continue
      },
      onResponse: (response, handler) {
        return handler.next(response); // continue
      },
      onError: (error, handler) {
        print(error);
        return handler.next(error); //continue
      },
    ));
  } // end of initializeInterceptor

}
