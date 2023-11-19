import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void UploadExcelModel(context) {
  var alertStyle = AlertStyle(
    isCloseButton: true,
    isOverlayTapDismiss: false,
    descStyle: const TextStyle(fontWeight: FontWeight.bold),
    descTextAlign: TextAlign.start,
    animationDuration: const Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: const BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: const TextStyle(
      color: Colors.white,
    ),
  );
  Alert(
    context: context,
    type: AlertType.none,
    title: "Insert Excel File",
    style: alertStyle,
    // desc: "Flutter is more awesome with RFlutter Alert.",
    content: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: null,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              side: const BorderSide(
                color: Colors.white,
              ),
            ),
            child: const Text(
              "Upload File",
              style: TextStyle(color: Colors.white),
            )),
      ],
    ),
    buttons: [
      DialogButton(
        onPressed: () => Navigator.pop(context),
        gradient: const LinearGradient(colors: [
          Color.fromRGBO(116, 116, 191, 1.0),
          Color.fromRGBO(52, 138, 199, 1.0)
        ]),
        child: const Text(
          "Submit",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      )
    ],
  ).show();
}
