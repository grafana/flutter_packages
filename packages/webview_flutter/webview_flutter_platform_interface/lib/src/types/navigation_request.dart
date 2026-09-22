// Copyright 2013 The Flutter Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// Defines the parameters of the pending navigation callback.
class NavigationRequest {
  /// Creates a [NavigationRequest].
  const NavigationRequest({
    required this.url,
    required this.isMainFrame,
    this.method,
    this.headers,
  });

  /// The URL of the pending navigation request.
  final String url;

  /// Indicates whether the request was made in the web site's main frame or a subframe.
  final bool isMainFrame;

  /// The HTTP method of the pending navigation request, if available.
  ///
  /// The value is passed through from the platform without normalization.
  final String? method;

  /// The HTTP headers of the pending navigation request, if available.
  ///
  /// Platform implementations provide an unmodifiable snapshot. Header values
  /// may contain sensitive data and should not be logged.
  final Map<String, String>? headers;
}
