import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:judostore/storage/data-preferences.dart';
import 'package:judostore/ui/add-book/add-book-controller.dart';
import 'package:judostore/ui/attachment/attachment-screen.dart';
import 'package:judostore/ui/custom-views/edit-text.dart';

class AddBook extends StatelessWidget {
  AddBook({Key? key}) : super(key: key);
  final titleTxtController = TextEditingController();
  final descTxtController = TextEditingController();
  final authorTxtController = TextEditingController();
  final priceTxtController = TextEditingController();
  final qtyTxtController = TextEditingController();
  final addBookController = Get.put(AddBookController());
  final dataPreference = Get.find<DataPreferences>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: Get.width * 0.15,
                    child: IconButton(
                      icon: Icon(
                        Icons.account_circle,
                        color: Colors.black,
                      ),
                      onPressed: () async {
                        final attachmentID =
                            await Get.to(() => AttachmentScreen());
                        addBookController.attachmentId = attachmentID;
                      },
                    ),
                  ),
                ),
                EditText(
                    textController: titleTxtController, labelText: 'Title'),
                SizedBox(
                  height: 20,
                ),
                EditText(
                    textController: descTxtController,
                    labelText: 'Description'),
                SizedBox(
                  height: 20,
                ),
                EditText(
                    textController: authorTxtController, labelText: 'Author'),
                SizedBox(
                  height: 20,
                ),
                EditText(
                    textController: priceTxtController, labelText: 'Price'),
                SizedBox(
                  height: 20,
                ),
                EditText(
                    textController: qtyTxtController, labelText: 'Quantity'),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FocusManager.instance.primaryFocus?.unfocus();
          Map<String, dynamic> map = {
            "userid": dataPreference.readPreference(dataPreference.kUserKey),
            "title": titleTxtController.text,
            "description": descTxtController.text,
            "author": authorTxtController.text,
            "quantity": qtyTxtController.text,
            "price": priceTxtController.text,
            "attachmentid": addBookController.attachmentId
          };
          addBookController.addBook(map);
        },
        child: Icon(
          Icons.done,
          color: Colors.black,
        ),
      ),
    );
  }
}
