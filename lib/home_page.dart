//
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   bool _isLoading = true;
//   bool _hasError = false;
//
//   final Completer<WebViewController> _controllerCompleter = Completer<WebViewController>();
//   final WebViewController controller = WebViewController()
//     ..setJavaScriptMode(JavaScriptMode.unrestricted)
//     ..setBackgroundColor(const Color(0x00000000))
//     ..setNavigationDelegate(
//       NavigationDelegate(
//         onProgress: (int progress) {
//           // Update loading bar.
//         },
//         onPageStarted: (String url) {
//           print("1");
//           sets
//         },
//         onPageFinished: (String url) {
//           print("2");
//         },
//         onHttpError: (HttpResponseError error) {
//           print("server problem");
//         },
//         onWebResourceError: (WebResourceError error) {     print("server problem 1");},
//         onNavigationRequest: (NavigationRequest request) {
//           if (request.url.startsWith('https://www.youtube.com/')) {
//             return NavigationDecision.prevent;
//           }
//           return NavigationDecision.navigate;
//         },
//       ),
//     )
//     ..loadRequest(Uri.parse('https://bovineleathergbd.com/'));
//
//   DateTime? _lastPressed;
//
//
//   Future<bool> _onWillPop() async {
//     if (await controller.canGoBack()) {
//       await controller.goBack();
//       return Future.value(false);
//     } else {
//       return await showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: const Text('Are you sure?'),
//           content: const Text('Do you want to exit the app?'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(false), // Cancel
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(true), // Exit
//               child: const Text('Exit'),
//             ),
//           ],
//         ),
//       ) ?? false;
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: _onWillPop,
//       //     () async {
//       //   DateTime now = DateTime.now();
//       //   if (_lastPressed == null || now.difference(_lastPressed!) > Duration(seconds: 2)) {
//       //     _lastPressed = now;
//       //     if (await controller.canGoBack()) {
//       //       await controller.goBack();
//       //     } else {
//       //       ScaffoldMessenger.of(context).showSnackBar(
//       //         const SnackBar(content: Text("Press back again to exit")),
//       //       );
//       //     }
//       //     return Future.value(false);
//       //   }
//       //   return Future.value(true);
//       // },
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Bovine Leather'),
//           actions: <Widget>[
//             IconButton(
//               icon: const Icon(Icons.arrow_back),
//               onPressed: () async {
//                 if (await controller.canGoBack()) {
//                   await controller.goBack();
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text("No back history")),
//                   );
//                 }
//               },
//             ),
//             IconButton(
//               icon: const Icon(Icons.refresh),
//               onPressed: () {
//                 controller.reload();
//               },
//             ),
//           ],
//         ),
//         body: SafeArea(
//           child: WebViewWidget(controller: controller),
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<WebViewController> _controllerCompleter =
      Completer<WebViewController>();
  WebViewController? _controller;
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar if needed.
          },
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
              _hasError = false;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
          onHttpError: (HttpResponseError error) {
            print("onHttpError");
            print(error);
            // _showServerError();
          },
          onWebResourceError: (WebResourceError error) {
            print("onWebResourceError");
            print(error);
            // _showServerError();
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://bovineleatherbd.com/'));
  }

  // void _showServerError() {
  //   setState(() {
  //     _hasError = true;
  //     _isLoading = false;
  //   });
  // }

  Future<bool> _onWillPop() async {
    if (_hasError) {
      return true; // Exit the app if on error page
    }

    if (await _controller?.canGoBack() ?? false) {
      await _controller?.goBack();
      return Future.value(false);
    } else {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Are you sure?'),
              content: const Text('Do you want to exit the app?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false), // Cancel
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true), // Exit
                  child: const Text('Exit'),
                ),
              ],
            ),
          ) ??
          false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bovine Leather'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () async {
                if (await _controller?.canGoBack() ?? false) {
                  await _controller?.goBack();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("No back history")),
                  );
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  _hasError = false;
                  _isLoading = true;
                });
                _controller?.reload();
              },
            ),
          ],
        ),
        body: SafeArea(
          child: _hasError
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error, size: 100, color: Colors.red),
                      const SizedBox(height: 16),
                      const Text(
                        "Server Error",
                        style: TextStyle(fontSize: 24, color: Colors.red),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _hasError = false;
                            _isLoading = true;
                          });
                          _controller?.reload();
                        },
                        child: const Text("Retry"),
                      ),
                    ],
                  ),
                )
              : Stack(
                  children: [
                    WebViewWidget(controller: _controller!),
                    if (_isLoading)
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}
