import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'network_helper.dart';

class NetworkHelperImpl extends NetworkHelper {

  @override
  Future <http.Response> get (String url, {Map headers}) {

    log ('HTTP GET: $url');

    return http.get (url, headers: appendHeader(headers: headers)).then ((
      http.Response response,
    ) {
      return handleResponse (response);
    });
  }

  @override
  Future<http.Response> post(String url, {Map<String, String> headers, body, encoding}) {
    return http
        .post(url,
            body: json.encode(body),
            headers: appendHeader(headers: headers),
            encoding: encoding)
        .then((http.Response response) {
      return handleResponse(response);
    });
  }

  @override
  Future<http.Response> delete(String url, {Map headers}) {
    return http
        .delete(url, headers: appendHeader(headers: headers))
        .then((http.Response response) {
      return handleResponse(response);
    });
  }

  @override
  Future<http.Response> put(String url, {Map headers, body, encoding}) {
    return http
        .put(url,
            body: json.encode(body),
            headers: appendHeader(headers: headers),
            encoding: encoding)
        .then(
      (http.Response response) {
        return handleResponse(response);
      },
    );
  }

  @override
  http.Response handleResponse(http.Response response) {
    final int statusCode = response.statusCode;
    switch (statusCode) {
      case 401:
        {
          throw new Exception("Unauthorized 401");
        }
      case 500:
        {
          throw new Exception("Internal server error");
        }
      default:
        return response;
    }
  }

  @override
  Map appendHeader({Map headers, bool refresh = false}) {
    try {
      if (headers == null) {
        headers = <String, String>{};
      }
//      final String authToken = "";
//
//      if (authToken == null || authToken.isEmpty)
//        throw ("Id token cannot be empty!");
//
//      headers["Authorization"] = 'Bearer $authToken';
//      headers["Content-Type"] = "application/json";
    } catch (e) {
      debugPrint(e.toString());
    }

    return headers;
  }
}
