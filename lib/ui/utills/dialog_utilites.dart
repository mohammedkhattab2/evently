import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return CupertinoAlertDialog(
        content: Row(
          children: [
            Text("Loading ...."),
            Spacer(),
            CircularProgressIndicator(),
          ],
        ),
      );
    },
  );
}

showMessege(
  BuildContext context, {

  String? title,
  String? content,
  String? posButtonTitle,
  Function? onPositiveButtonClick,
   String? negsButtonTitle,
  Function? onNegButtonClick,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return CupertinoAlertDialog(
        title: title != null ? Text(title) : null,
        content: content != null ? Text(content) : null,
        actions: [
          if (posButtonTitle != null)
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                if (onPositiveButtonClick != null) onPositiveButtonClick();
              },
              child: Text(posButtonTitle),

            ),
            if (negsButtonTitle != null)
            TextButton(onPressed: (){
              Navigator.pop(context);
                if (onNegButtonClick != null) onNegButtonClick();
            }, 
            child: Text(negsButtonTitle)
            
            )
        ],
      );
    },
  );
}
