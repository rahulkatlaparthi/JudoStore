import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showProgressDialog({String? message}) {
  Get.dialog(
    Dialog(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoActivityIndicator(),
            SizedBox(height: 8),
            Text(message ?? 'Loading...'),
          ],
        ),
      ),
    ),
  );
}

void showAlertDialog({required String message}) {
  if (Get.isDialogOpen == true) {
    return;
  }
  Get.dialog(
    Dialog(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Alert'),
            SizedBox(height: 8),
            Text(message),
            SizedBox(height: 8),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Okay'))
          ],
        ),
      ),
    ),
  );
}

void showMyDialog({required Widget view}) {
  if (Get.isDialogOpen == true) {
    return;
  }
  Get.dialog(
    Dialog(
      backgroundColor: Colors.white,
      child: Padding(padding: const EdgeInsets.all(16.0), child: view),
    ),
  );
}

void hideProgressDialog() {
  if (Get.isDialogOpen == true) {
    Get.back();
  }
}
