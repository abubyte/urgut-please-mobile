import 'dart:math' as math;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class PrettyDioLogger extends Interceptor {
  /// Print request [Options]
  final bool request;

  /// Print request header [Options.headers]
  final bool requestHeader;

  /// Print request data [Options.data]
  final bool requestBody;

  /// Print [Response.data]
  final bool responseBody;

  /// Print [Response.headers]
  final bool responseHeader;

  /// Print error message
  final bool error;

  /// InitialTab count to logPrint json response
  static const int initialTab = 1;

  /// 1 tab length
  static const String tabStep = '    ';

  /// Print compact json response
  final bool compact;

  /// Width size per logPrint
  final int maxWidth;

  /// Log printer; defaults logPrint log to console.
  /// In flutter, you'd better use debugPrint.
  /// you can also write log in a file.
  DebugPrintCallback logPrint;

  PrettyDioLogger({
    this.request = true,
    this.requestHeader = false,
    this.requestBody = false,
    this.responseHeader = false,
    this.responseBody = true,
    this.error = true,
    this.maxWidth = 90,
    this.compact = true,
    this.logPrint = debugPrintThrottled,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (request) {
      _printRequestHeader(options);
    }
    if (requestHeader) {
      _printMapAsTable(options.queryParameters, header: 'Query Parameters');
      final requestHeaders = <String, dynamic>{};
      requestHeaders.addAll(options.headers);
      requestHeaders['contentType'] = options.contentType?.toString();
      requestHeaders['responseType'] = options.responseType.toString();
      requestHeaders['followRedirects'] = options.followRedirects;
      requestHeaders['connectTimeout'] = options.connectTimeout;
      requestHeaders['receiveTimeout'] = options.receiveTimeout;
      _printMapAsTable(requestHeaders, header: 'Headers');
      _printMapAsTable(options.extra, header: 'Extras');
    }
    if (requestBody && options.method != 'GET') {
      final dynamic data = options.data;
      if (data != null) {
        if (data is Map) _printMapAsTable(options.data as Map?, header: 'Body');
        if (data is FormData) {
          final formDataMap = <String, dynamic>{}
            ..addEntries(data.fields)
            ..addEntries(data.files);
          _printMapAsTable(formDataMap, header: 'Form data | ${data.boundary}');
        } else {
          _printBlock(data.toString());
        }
      }
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (error) {
      if (err.type == DioExceptionType.badResponse) {
        final uri = err.response?.requestOptions.uri;
        _printBoxed(
          header: 'DioError â•‘ Status: ${err.response?.statusCode} ${err.response?.statusMessage}',
          text: uri.toString(),
        );
        if (err.response != null && err.response?.data != null) {
          logPrint('â•” ${err.type.toString()}');
          _printResponse(err.response!);
        }
        _printLine('â•š');
        logPrint('');
      } else {
        _printBoxed(header: 'DioError â•‘ ${err.type}', text: err.message);
      }
    }
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _printResponseHeader(response);
    if (responseHeader) {
      final responseHeaders = <String, String>{};
      response.headers.forEach((k, list) => responseHeaders[k] = list.toString());
      _printMapAsTable(responseHeaders, header: 'Headers');
    }

    if (responseBody) {
      logPrint('â•” Body');
      logPrint('â•‘');
      _printResponse(response);
      logPrint('â•‘');
      _printLine('â•š');
    }
    super.onResponse(response, handler);
  }

  void _printBoxed({String? header, String? text}) {
    logPrint('');
    logPrint('â•”â•£ $header');
    logPrint('â•‘  $text');
    _printLine('â•š');
  }

  void _printResponse(Response response) {
    if (response.data != null) {
      if (response.data is Map) {
        _printPrettyMap(response.data as Map);
      } else if (response.data is List) {
        logPrint('â•‘${_indent()}[');
        _printList(response.data as List);
        logPrint('â•‘${_indent()}[');
      } else {
        _printBlock(response.data.toString());
      }
    }
  }

  void _printResponseHeader(Response response) {
    final uri = response.requestOptions.uri;
    final method = response.requestOptions.method;
    _printBoxed(
      header: 'Response â•‘ $method â•‘ Status: ${response.statusCode} ${response.statusMessage}',
      text: uri.toString(),
    );
  }

  void _printRequestHeader(RequestOptions options) {
    final uri = options.uri;
    final method = options.method;
    _printBoxed(header: 'Request â•‘ $method ', text: uri.toString());
  }

  void _printLine([String pre = '', String suf = 'â•']) => logPrint('$pre${'â•' * maxWidth}$suf');

  void _printKV(String? key, Object? v) {
    final pre = 'â•Ÿ $key: ';
    final msg = v.toString();

    if (pre.length + msg.length > maxWidth) {
      logPrint(pre);
      _printBlock(msg);
    } else {
      logPrint('$pre$msg');
    }
  }

  void _printBlock(String msg) {
    final lines = (msg.length / maxWidth).ceil();
    for (var i = 0; i < lines; ++i) {
      logPrint(
        (i >= 0 ? 'â•‘ ' : '') + msg.substring(i * maxWidth, math.min<int>(i * maxWidth + maxWidth, msg.length)),
      );
    }
  }

  String _indent([int tabCount = initialTab]) => tabStep * tabCount;

  void _printPrettyMap(Map data, {int tabs = initialTab, bool isListItem = false, bool isLast = false}) {
    var tabs0 = tabs;
    final isRoot = tabs0 == initialTab;
    final initialIndent = _indent(tabs0);
    tabs0++;

    if (isRoot || isListItem) logPrint('â•‘$initialIndent{');

    data.keys.toList().asMap().forEach((index, dynamic key) {
      final isLast = index == data.length - 1;
      dynamic value = data[key];
      if (value is String) {
        value = '"${value.toString().replaceAll(RegExp(r'(\r|\n)+'), " ")}"';
      }
      if (value is Map) {
        if (compact && _canFlattenMap(value)) {
          logPrint('â•‘${_indent(tabs0)} $key: $value${!isLast ? ',' : ''}');
        } else {
          logPrint('â•‘${_indent(tabs0)} $key: {');
          _printPrettyMap(value, tabs: tabs0);
        }
      } else if (value is List) {
        if (compact && _canFlattenList(value)) {
          logPrint('â•‘${_indent(tabs0)} $key: ${value.toString()}');
        } else {
          logPrint('â•‘${_indent(tabs0)} $key: [');
          _printList(value, tabs: tabs0);
          logPrint('â•‘${_indent(tabs0)} ]${isLast ? '' : ','}');
        }
      } else {
        final msg = value.toString().replaceAll('\n', '');
        final indent = _indent(tabs0);
        final linWidth = maxWidth - indent.length;
        if (msg.length + indent.length > linWidth) {
          final lines = (msg.length / linWidth).ceil();
          for (var i = 0; i < lines; ++i) {
            logPrint(
              'â•‘${_indent(tabs0)} ${msg.substring(i * linWidth, math.min<int>(i * linWidth + linWidth, msg.length))}',
            );
          }
        } else {
          logPrint('â•‘${_indent(tabs0)} $key: $msg${!isLast ? ',' : ''}');
        }
      }
    });

    logPrint('â•‘$initialIndent}${isListItem && !isLast ? ',' : ''}');
  }

  void _printList(List list, {int tabs = initialTab}) {
    list.asMap().forEach((i, dynamic e) {
      final isLast = i == list.length - 1;
      if (e is Map) {
        if (compact && _canFlattenMap(e)) {
          logPrint('â•‘${_indent(tabs)}  $e${!isLast ? ',' : ''}');
        } else {
          _printPrettyMap(e, tabs: tabs + 1, isListItem: true, isLast: isLast);
        }
      } else {
        logPrint('â•‘${_indent(tabs + 2)} $e${isLast ? '' : ','}');
      }
    });
  }

  bool _canFlattenMap(Map map) {
    return map.values.where((dynamic val) => val is Map || val is List).isEmpty && map.toString().length < maxWidth;
  }

  bool _canFlattenList(List list) {
    return list.length < 10 && list.toString().length < maxWidth;
  }

  void _printMapAsTable(Map? map, {String? header}) {
    if (map == null || map.isEmpty) return;
    logPrint('â•” $header ');
    map.forEach((dynamic key, dynamic value) => _printKV(key.toString(), value));
    _printLine('â•š');
  }
}
