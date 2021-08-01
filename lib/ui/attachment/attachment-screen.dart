import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:judostore/ui/attachment/attachment-controller.dart';

class AttachmentScreen extends StatelessWidget {
  AttachmentScreen({Key? key}) : super(key: key);
  final ImagePicker imagePicker = ImagePicker();
  final attachmentController = Get.put(AttachmentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: Get.height * 0.3,
              child: Obx(() {
               if(attachmentController.imageUrl.value == null){
                 return Icon(Icons.image);
               } else {
                 return Image.file(File(attachmentController.imageUrl.value!.path));
               }
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  onPressed: () async {
                    final XFile? loc = await imagePicker.pickImage(source: ImageSource.camera);
                    if(loc != null){
                      attachmentController.updateImage(loc);
                    }
                  },
                  child: Text('Open Camera'),
                ),
                CupertinoButton(
                  onPressed: () async {
                    final XFile? loc = await imagePicker.pickImage(source: ImageSource.gallery);
                    if(loc != null){
                      attachmentController.updateImage(loc);
                    }
                  },
                  child: Text('Open Gallery'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          attachmentController.saveAttachment();
        },
        child: Icon(Icons.done),
      ),
    );
  }
}
