import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({Key? key, required this.show}) : super(key: key);
  final bool show;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: show ? _platformIndicator(context) : const SizedBox.shrink(),
        ),
      ),
    );
  }

  Widget _platformIndicator(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Platform.isIOS
          ? const Padding(
              padding: EdgeInsets.all(8.0),
              child: CupertinoActivityIndicator(),
            )
          : Container(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 32,
                    width: 32,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
