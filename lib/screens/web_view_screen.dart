import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../logic/blocs/internet/internet_bloc.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<InternetBloc, InternetState>(
          builder: (context, state) {
            if (state is InternetConnected) {
              return WebView(
                zoomEnabled: false,
                gestureNavigationEnabled: true,
                onProgress: (progress) {},
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: 'https://www.google.com/',
              );
            }
            if (state is InternetDisconnected) {
              return Center(
                child: Text(
                  state.msg,
                  style: GoogleFonts.lato(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
