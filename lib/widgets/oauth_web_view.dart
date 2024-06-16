import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iynfluencer/core/utils/logs.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/notificationApi.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class OAuthWebView extends StatefulWidget {
  final String oauthUrl;
  final bool innerWebView;

  OAuthWebView({this.innerWebView = true, required this.oauthUrl});

  @override
  _OAuthWebViewState createState() => _OAuthWebViewState();
}

class _OAuthWebViewState extends State<OAuthWebView> {
  final notificationClient = NotificationClient();
  late final WebViewController _controller;
  final callbackUrlScheme = 'com.iynfluencer.app';
  final redirectUrl =
      'https://iynf-kong-akbf9.ondigitalocean.app/chats/oauth/google/callback';

  @override
  void initState() {
    if (!widget.innerWebView) {
   //   _authWithExternalWebView();
    }
    super.initState();
  }
/* 
  _authWithExternalWebView() async {
    try {
      final result = await FlutterWebAuth.authenticate(
        url: widget.oauthUrl,
        callbackUrlScheme: callbackUrlScheme,
        preferEphemeral: true,
      );
      _handleAuthResponse(result);
    } on PlatformException catch (e) {
      l('OAuthWebView', 'PlatformException', e.message);
      Navigator.of(context).pop({'error': e});
    } catch (e) {
      l('OAuthWebView', 'Exception', e.toString());
      Navigator.of(context).pop({'error': e});
    }
  } */

  /* _handleAuthResponse(String response) {
    if (response.contains('?code=')) {
      final code = response.split('=')[1];
      l('build', 'code', code);
      Navigator.of(context).pop({
        'code': code,
      });
      return NavigationDecision.prevent;
    }

    if (response.contains('?error=')) {
      final error = response.split('=')[1].split('&')[0];
      l('build', 'error', error);
      Navigator.of(context).pop({
        'error': error,
      });
    }
  } */

/* 
_handleAuthResponse(String response) {
  if (response.contains('?code=')) {
    final code = response.split('=')[1];
    l('OAuthWebView', 'Authorization Code', code);
    Navigator.of(context).pop({'code': code});
  } else if (response.contains('?error=')) {
    final error = response.split('=')[1].split('&')[0];
    l('OAuthWebView', 'Error', error);
    Navigator.of(context).pop({'error': error});
  } else {
    l('OAuthWebView', 'Unknown Response', response);
    Navigator.of(context).pop({'error': 'Unknown response from OAuth server'});
  }
} */

  _handleAuthResponse(String response) {
    if (response.contains('?code=')) {
      final Uri uri = Uri.parse(response);
      final code = uri.queryParameters['code'];
      l('OAuthWebView', 'Authorization Code', code);
      Navigator.of(context).pop({'code': code});
    } else if (response.contains('?error=')) {
      final Uri uri = Uri.parse(response);
      final error = uri.queryParameters['error'];
      l('OAuthWebView', 'Error', error);
      Navigator.of(context).pop({'error': error});
    } else {
      l('OAuthWebView', 'Unknown Response', response);
      Navigator.of(context)
          .pop({'error': 'Unknown response from OAuth server'});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.innerWebView
          ? WebView(
              key: UniqueKey(),
              initialUrl: widget.oauthUrl,
              javascriptMode: JavascriptMode.unrestricted,
              
              navigationDelegate: (NavigationRequest request) {
              l('OAuthWebView', 'onUrlChange', request.url);

                if (request.url.startsWith(redirectUrl)) {
                  _handleAuthResponse(request.url);
                  return NavigationDecision.prevent;
                }

                return NavigationDecision.navigate;
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
