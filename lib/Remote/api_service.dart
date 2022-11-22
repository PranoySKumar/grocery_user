import 'package:get/get_connect/connect.dart';
import 'package:get_storage/get_storage.dart';

class ApiService extends GetConnect {
  ApiService() {
    baseUrl = "http://192.168.43.39:4000/user";
  }

  //headers
  static final Map<String, String> defaultHeaders = {
    "Content-Type": "application/json",
    "Authorization": "Bearer ${GetStorage().read("token")}",
  };
  @override
  String get defaultContentType => "application/json";

  @override
  Future<Response<T>> get<T>(String url,
      {Map<String, String>? headers,
      String? contentType,
      Map<String, dynamic>? query,
      Decoder<T>? decoder}) {
    return super.get(url,
        headers: headers ?? defaultHeaders,
        contentType: contentType ?? defaultContentType,
        query: query,
        decoder: decoder);
  }

  @override
  Future<Response<T>> post<T>(String? url, body,
      {String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Decoder<T>? decoder,
      Progress? uploadProgress}) {
    return super.post(url, body,
        headers: headers ?? defaultHeaders,
        contentType: contentType ?? defaultContentType,
        query: query,
        decoder: decoder,
        uploadProgress: uploadProgress);
  }

  @override
  Future<Response<T>> delete<T>(String url,
      {Map<String, String>? headers,
      String? contentType,
      Map<String, dynamic>? query,
      Decoder<T>? decoder}) {
    return super.delete(url,
        headers: headers ?? defaultHeaders,
        contentType: contentType ?? defaultContentType,
        query: query,
        decoder: decoder);
  }

  @override
  Future<Response<T>> put<T>(String url, body,
      {String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Decoder<T>? decoder,
      Progress? uploadProgress}) {
    return super.put(url, body,
        headers: headers ?? defaultHeaders,
        contentType: contentType ?? defaultContentType,
        query: query,
        decoder: decoder,
        uploadProgress: uploadProgress);
  }
}
