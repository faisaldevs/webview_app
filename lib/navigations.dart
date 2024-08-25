// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: WebViewExample(),
//     );
//   }
// }
//
// class WebViewExample extends StatefulWidget {
//   @override
//   WebViewExampleState createState() => WebViewExampleState();
// }
//
// class WebViewExampleState extends State<WebViewExample> {
//   late WebViewController _controller;
//   final Completer<WebViewController> _controllerCompleter = Completer<WebViewController>();
//   bool _isLoading = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Full WebView Example'),
//         actions: <Widget>[
//           NavigationControls(_controllerCompleter.future),
//         ],
//       ),
//       body: Stack(
//         children: <Widget>[
//           WebView(
//             initialUrl: 'https://flutter.dev',
//             javascriptMode: JavascriptMode.unrestricted,
//             onWebViewCreated: (WebViewController webViewController) {
//               _controllerCompleter.complete(webViewController);
//               _controller = webViewController;
//             },
//             onPageStarted: (String url) {
//               setState(() {
//                 _isLoading = true;
//               });
//             },
//             onPageFinished: (String url) {
//               setState(() {
//                 _isLoading = false;
//               });
//             },
//           ),
//           _isLoading
//               ? Center(
//             child: CircularProgressIndicator(),
//           )
//               : Container(),
//         ],
//       ),
//     );
//   }
// }
//
// class NavigationControls extends StatelessWidget {
//   const NavigationControls(this._webViewControllerFuture)
//       : assert(_webViewControllerFuture != null);
//
//   final Future<WebViewController> _webViewControllerFuture;
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<WebViewController>(
//       future: _webViewControllerFuture,
//       builder:
//           (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
//         final bool webViewReady =
//             snapshot.connectionState == ConnectionState.done;
//         final WebViewController? controller = snapshot.data;
//         return Row(
//           children: <Widget>[
//             IconButton(
//               icon: Icon(Icons.arrow_back_ios),
//               onPressed: !webViewReady
//                   ? null
//                   : () async {
//                 if (await controller!.canGoBack()) {
//                   await controller.goBack();
//                 }
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.arrow_forward_ios),
//               onPressed: !webViewReady
//                   ? null
//                   : () async {
//                 if (await controller!.canGoForward()) {
//                   await controller.goForward();
//                 }
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.replay),
//               onPressed: !webViewReady
//                   ? null
//                   : () {
//                 controller!.reload();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: WebViewExample(),
//     );
//   }
// }
//
// class WebViewExample extends StatefulWidget {
//   @override
//   WebViewExampleState createState() => WebViewExampleState();
// }
//
// class WebViewExampleState extends State<WebViewExample> {
//   late WebViewController _controller;
//   final Completer<WebViewController> _controllerCompleter = Completer<WebViewController>();
//   bool _isLoading = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Full WebView Example'),
//         actions: <Widget>[
//           NavigationControls(_controllerCompleter.future),
//         ],
//       ),
//       body: Stack(
//         children: <Widget>[
//           WebView(
//             initialUrl: 'https://flutter.dev',
//             javascriptMode: JavascriptMode.unrestricted,
//             onWebViewCreated: (WebViewController webViewController) {
//               _controllerCompleter.complete(webViewController);
//               _controller = webViewController;
//             },
//             onPageStarted: (String url) {
//               setState(() {
//                 _isLoading = true;
//               });
//             },
//             onPageFinished: (String url) {
//               setState(() {
//                 _isLoading = false;
//               });
//             },
//           ),
//           _isLoading
//               ? Center(
//             child: CircularProgressIndicator(),
//           )
//               : Container(),
//         ],
//       ),
//     );
//   }
// }
//
// class NavigationControls extends StatelessWidget {
//   const NavigationControls(this._webViewControllerFuture)
//       : assert(_webViewControllerFuture != null);
//
//   final Future<WebViewController> _webViewControllerFuture;
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<WebViewController>(
//       future: _webViewControllerFuture,
//       builder:
//           (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
//         final bool webViewReady =
//             snapshot.connectionState == ConnectionState.done;
//         final WebViewController? controller = snapshot.data;
//         return Row(
//           children: <Widget>[
//             IconButton(
//               icon: Icon(Icons.arrow_back_ios),
//               onPressed: !webViewReady
//                   ? null
//                   : () async {
//                 if (await controller!.canGoBack()) {
//                   await controller.goBack();
//                 }
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.arrow_forward_ios),
//               onPressed: !webViewReady
//                   ? null
//                   : () async {
//                 if (await controller!.canGoForward()) {
//                   await controller.goForward();
//                 }
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.replay),
//               onPressed: !webViewReady
//                   ? null
//                   : () {
//                 controller!.reload();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
