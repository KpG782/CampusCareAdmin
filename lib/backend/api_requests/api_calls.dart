import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SendEmailCall {
  static Future<ApiCallResponse> call({
    String? toEmail = '',
    String? subject = '',
    String? content = '',
  }) async {
    final ffApiRequestBody = '''
{
  "personalizations": [
    {
      "to": [
        {
          "email": "${escapeStringForJson(toEmail)}"
        }
      ],
      "subject": "${escapeStringForJson(subject)}"
    }
  ],
  "content": [
    {
      "type": "text/plain",
      "value": "${escapeStringForJson(content)}"
    }
  ],
  "from": {
    "email": "kenpatrickgarcia123@gmail.com",
    "name": "FlutterFlow"
  },
  "reply_to": {
    "email": "kenpatrickgarcia123@gmail.com",
    "name": "FlutterFlow"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendEmail',
      apiUrl: 'https://api.sendgrid.com/v3/mail/send',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            // 'YOURKEY',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteUserByEmailCall {
  static Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'deleteUserByEmail',
      apiUrl:
          'https://us-central1-campus-care-izsd1a.cloudfunctions.net/deleteUserByEmail',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateUserWithDetailsCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? userBio = '',
    String? userDept = '',
    String? userName = '',
    String? password = '',
    String? role = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "password": "${escapeStringForJson(password)}",
  "userDept": "${escapeStringForJson(userDept)}",
  "userBio": "${escapeStringForJson(userBio)}",
  "userName": "${escapeStringForJson(userName)}",
  "role": "${escapeStringForJson(role)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createUserWithDetails',
      apiUrl:
          'https://us-central1-campus-care-izsd1a.cloudfunctions.net/createUserWithDetails',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateEmailCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? uid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
   "uid":  "${escapeStringForJson(uid)}"            }''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateEmail',
      apiUrl:
          'https://us-central1-campus-care-izsd1a.cloudfunctions.net/updateEmail',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
