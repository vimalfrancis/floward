import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

customedrawer(BuildContext context) {
  return Drawer(
      child: Padding(
          padding: const EdgeInsets.only(left: 50, top: 50, right: 50),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 40,
            ),
            Text("SelectLanguage".tr()),
            Column(
              children: translator.locals().map((Locale i) {
                return TextButton(
                  onPressed: () {
                    translator.setNewLanguage(
                      context,
                      newLanguage: i.languageCode,
                    );
                  },
                  child: Text(i.languageCode == "ar" ? "العربية " : "English"),
                );
              }).toList(),
            )
          ])));
}
