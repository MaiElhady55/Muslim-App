import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/utils/styles.dart';
//import 'package:hexcolor/hexcolor.dart';

Future awesomeDialog(
  context,
  title,
  text,
) =>
    AwesomeDialog(
      context: context,
      headerAnimationLoop: false,
      animType: AnimType.bottomSlide,
      dialogType: DialogType.info,
      isDense: true,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 5 / 100,
          vertical: MediaQuery.of(context).size.height * 2 / 100),
      dialogBackgroundColor: const Color(0xff22211f),
      btnCancelOnPress: () {},
      btnCancelText: 'الغاء',
      buttonsTextStyle: Styles.textStyle18Ar.copyWith(fontFamily: ''),
      borderSide: const BorderSide(color: Colors.black, width: 4),
      width: MediaQuery.of(context).size.width * 90 / 100,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(child: Text(title, style: Styles.textStyle36)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 1 / 100,
            ),
            Text(
              'التفسير',
              style: Styles.textStyle24,
            ),
            myDivider(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 1 / 100,
            ),
            Text(text,
                textDirection: TextDirection.rtl, style: Styles.textStyle20),
          ],
        ),
      ),
    ).show();

Widget myDivider() => Container(
      width: double.infinity,
      color: Colors.grey,
      height: 1,
    );
