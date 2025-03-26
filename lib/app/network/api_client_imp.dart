// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:http_parser/src/media_type.dart';
// import 'package:knowgo/app/constants/config.dart';
// import 'package:knowgo/app/constants/messages.dart';
// import 'package:knowgo/app/helper/session_manager.dart';
// import 'package:knowgo/app/network/response_model.dart';

// import 'api_client.dart';
// import 'connectivity_validator.dart';
// import 'server_error.dart';

// class ApiClientImp implements ApiClient {
//   final SessionManager sessionManager;
//   ApiClientImp({required this.sessionManager});

//   Future<Map<String, String>> _buildHeaders() async {
//     var token = await sessionManager.getToken();

//     return {
//       'Content-Type': 'application/json',
//       'Authorization': token,
//     };
//   }

//   @override
//   Future<ResponseModel?> postApi(
//       {required String url, required Map<String, dynamic> body}) async {
//     final headers = await _buildHeaders();
//     debugPrint('URL: ${Config.BASE_URL + url}');
//     debugPrint('Body: $body');
//     debugPrint('Authorization: ${headers['Authorization']}');

//     bool isConnected = await ConnectivityProvider.checkConnectivity();
//     if (!isConnected) {
//       throw ServerError(201, Messages.NO_INTERNET);
//     }

//     http.Response response = await http
//         .post(
//       Uri.parse(Config.BASE_URL + url),
//       body: jsonEncode(body),
//       headers: headers,
//     )
//         .timeout(
//       const Duration(seconds: 60),
//       onTimeout: () {
//         throw ServerError(201, Messages.NETWORK_TIMEOUT);
//       },
//     ).onError(
//       (error, stackTrace) {
//         debugPrint('Network Error: $error');
//         throw ServerError(201, Messages.SERVER_NOT_RESPONDING);
//       },
//     );
//     debugPrint('Response Data: ${response.body}');
//     debugPrint('Status Code: ${response.statusCode}');
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       var data = ResponseModel.fromJson(jsonDecode(response.body));

//       return data;
//     } else if (response.statusCode == 401) {
//     } else {
//       throw ServerError(
//         response.statusCode,
//         jsonDecode(response.body)['message'],
//       );
//     }
//     return null;
//   }

//   @override
//   Future<ResponseModel?> getApi({required String url}) async {
//     final headers = await _buildHeaders();
//     debugPrint('URL: ${Config.BASE_URL + url}');

//     debugPrint('Authorization: ${headers['Authorization']}');

//     bool isConnected = await ConnectivityProvider.checkConnectivity();
//     if (!isConnected) {
//       throw ServerError(201, Messages.NO_INTERNET);
//     }

//     http.Response response = await http
//         .get(
//       Uri.parse(Config.BASE_URL + url),
//       headers: headers,
//     )
//         .timeout(
//       const Duration(seconds: 90),
//       onTimeout: () {
//         throw ServerError(201, Messages.NETWORK_TIMEOUT);
//       },
//     ).onError((error, stackTrace) {
//       debugPrint('Network Error: $error');
//       throw ServerError(201, Messages.SERVER_NOT_RESPONDING);
//     });
//     debugPrint('Response Data: ${response.body}');
//     if (response.statusCode == 200) {
//       var data = ResponseModel.fromJson(jsonDecode(response.body));
//       return data;
//     } else if (response.statusCode == 401) {
//       // logout(context);
//     } else {
//       throw ServerError(
//         response.statusCode,
//         jsonDecode(response.body)['message'],
//       );
//     }
//     return null;
//   }

//   @override
//   Future<ResponseModel?> deleteApi(
//       {required String url, required Map<String, dynamic> body}) async {
//     final headers = await _buildHeaders();
//     debugPrint('URL: ${Config.BASE_URL + url}');
//     debugPrint('Body: $body');
//     debugPrint('Authorization: ${headers['Authorization']}');

//     bool isConnected = await ConnectivityProvider.checkConnectivity();
//     if (!isConnected) {
//       throw ServerError(201, Messages.NO_INTERNET);
//     }

//     http.Response response = await http
//         .delete(
//       Uri.parse(Config.BASE_URL + url),
//       body: jsonEncode(body),
//       headers: headers,
//     )
//         .timeout(
//       const Duration(seconds: 60),
//       onTimeout: () {
//         throw ServerError(201, Messages.NETWORK_TIMEOUT);
//       },
//     ).onError(
//       (error, stackTrace) {
//         debugPrint('Network Error: $error');
//         throw ServerError(201, Messages.SERVER_NOT_RESPONDING);
//       },
//     );
//     debugPrint('Response Data: ${response.body}');
//     if (response.statusCode == 200) {
//       var data = ResponseModel.fromJson(jsonDecode(response.body));
//       return data;
//     } else if (response.statusCode == 401) {
//     } else {
//       throw ServerError(
//         response.statusCode,
//         jsonDecode(response.body)['message'],
//       );
//     }
//     return null;
//   }

//   @override
//   Future<ResponseModel?> putApi(
//       {required String url, required Map<String, dynamic> body}) async {
//     bool isConnected = await ConnectivityProvider.checkConnectivity();
//     if (!isConnected) {
//       throw ServerError(201, Messages.NO_INTERNET);
//     }
//     final headers = await _buildHeaders();
//     debugPrint('URL: ${Config.BASE_URL + url}');
//     debugPrint('Body: $body');
//     debugPrint('Authorization: ${headers['Authorization']}');

//     http.Response response = await http
//         .put(
//       Uri.parse(Config.BASE_URL + url),
//       body: jsonEncode(body),
//       headers: headers,
//     )
//         .timeout(
//       const Duration(seconds: 90),
//       onTimeout: () {
//         throw ServerError(201, Messages.NETWORK_TIMEOUT);
//       },
//     ).onError((error, stackTrace) {
//       debugPrint('Network Error: $error');
//       throw ServerError(201, Messages.SERVER_NOT_RESPONDING);
//     });
//     debugPrint('Response Data: ${response.body}');
//     if (response.statusCode == 200) {
//       var data = ResponseModel.fromJson(jsonDecode(response.body));
//       return data;
//     } else if (response.statusCode == 401) {
//     } else {
//       throw ServerError(
//         response.statusCode,
//         jsonDecode(response.body)['message'],
//       );
//     }
//     return null;
//   }

//   @override
//   Future<ResponseModel?> patchApi(
//       {required String url, required Map<String, dynamic> body}) async {
//     bool isConnected = await ConnectivityProvider.checkConnectivity();
//     if (!isConnected) {
//       throw ServerError(201, Messages.NO_INTERNET);
//     }
//     final headers = await _buildHeaders();
//     debugPrint('URL: ${Config.BASE_URL + url}');
//     debugPrint('Body: $body');
//     debugPrint('Authorization: ${headers['Authorization']}');

//     http.Response response = await http
//         .patch(
//       Uri.parse(Config.BASE_URL + url),
//       body: jsonEncode(body),
//       headers: headers,
//     )
//         .timeout(
//       const Duration(seconds: 90),
//       onTimeout: () {
//         throw ServerError(201, Messages.NETWORK_TIMEOUT);
//       },
//     ).onError((error, stackTrace) {
//       debugPrint('Network Error: $error');
//       throw ServerError(201, Messages.SERVER_NOT_RESPONDING);
//     });
//     debugPrint('Response Data: ${response.body}');
//     if (response.statusCode == 200) {
//       var data = ResponseModel.fromJson(jsonDecode(response.body));
//       return data;
//     } else if (response.statusCode == 401) {
//     } else {
//       throw ServerError(
//         response.statusCode,
//         jsonDecode(response.body)['message'],
//       );
//     }
//     return null;
//   }

//   @override
//   Future<ResponseModel?> multipartApi(
//       {required String url,
//       required File file,
//       required Map<String, String> body,
//       required String imageKey,
//       MediaType? mediaType}) async {
//     final headers = await _buildHeaders();
//     debugPrint('URL: ${Config.BASE_URL + url}');
//     debugPrint('Body: $body');
//     debugPrint('Authorization: ${headers['Authorization']}');

//     var request = http.MultipartRequest(
//       'POST',
//       Uri.parse(
//         '${Config.BASE_URL}$url',
//       ),
//     );
//     request.headers.addAll(headers);
//     request.fields.addAll(body);

//     request.files.add(await http.MultipartFile.fromPath(
//       imageKey,
//       file.path,
//       filename: file.path.split('/').last,
//       contentType: mediaType ?? MediaType('image', 'jpeg'),
//     ));

//     debugPrint('body: $body');

//     http.StreamedResponse response = await request.send();
//     var result = await response.stream.bytesToString();
//     debugPrint("data: $result");

//     if (response.statusCode == 200) {
//       var data = ResponseModel.fromJson(jsonDecode(result));
//       return data;
//     } else if (response.statusCode == 401) {
//     } else {
//       throw ServerError(response.statusCode, jsonDecode(result)['msg']);
//     }
//     return null;
//   }
// }
