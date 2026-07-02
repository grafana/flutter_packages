// Copyright 2013 The Flutter Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The time at which a user script is injected into a web page.
///
/// Used by [PlatformWebViewController.addUserScript].
enum UserScriptInjectionTime {
  /// The script is injected after the document element is created, but before
  /// any other content is loaded.
  ///
  /// Use this to run code before the page's own scripts execute, e.g. to patch
  /// `window` APIs.
  documentStart,

  /// The script is injected after the document has finished loading.
  ///
  /// Not supported on Android, which only offers document-start injection.
  documentEnd,
}
