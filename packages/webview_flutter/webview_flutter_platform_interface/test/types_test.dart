// Copyright 2013 The Flutter Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:webview_flutter_platform_interface/src/types/types.dart';

void main() {
  group('types', () {
    group('NavigationRequest', () {
      test('defaults unavailable request metadata to null', () {
        const request = NavigationRequest(url: 'https://flutter.dev', isMainFrame: true);

        expect(request.method, isNull);
        expect(request.headers, isNull);
      });

      test('preserves explicit request metadata without exposing it in diagnostics', () {
        const request = NavigationRequest(
          url: 'https://flutter.dev',
          isMainFrame: true,
          method: '',
          headers: <String, String>{'Authorization': 'sensitive-value'},
        );

        expect(request.method, '');
        expect(request.headers, <String, String>{'Authorization': 'sensitive-value'});
        expect(request.toString(), isNot(contains('sensitive-value')));
      });
    });

    test('WebResourceRequest', () {
      final Uri uri = Uri.parse('https://www.google.com');
      final request = WebResourceRequest(uri: uri);
      expect(request.uri, uri);
    });

    test('WebResourceResponse', () {
      final Uri uri = Uri.parse('https://www.google.com');
      const statusCode = 404;
      const headers = <String, String>{'a': 'header'};

      final response = WebResourceResponse(uri: uri, statusCode: statusCode, headers: headers);

      expect(response.uri, uri);
      expect(response.statusCode, statusCode);
      expect(response.headers, headers);
    });
  });
}
