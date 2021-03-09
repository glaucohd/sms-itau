import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sms_itau/controller/home_controller.dart';
import '../model/sms_info.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:url_launcher/url_launcher.dart';


class SmsItem extends StatefulWidget {
  final SmsInfo smsInfo;
  SmsItem(this.smsInfo);

  @override
  _SmsItemState createState() => _SmsItemState();
}

class _SmsItemState extends State<SmsItem> {

  final StreamController streamAlert = StreamController();

  Sink get streamAlertInput => streamAlert.sink;

  Stream get streamAlertOutput => streamAlert.stream;

  
  void dispose(){
    streamAlert.close();
  }



  bool desabeldButton = false;
  final HomeController homeController = HomeController();

  Future<void> showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Só um instante!',
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Column(
                  children: [
                    CircularProgressIndicator(),
                  ],
                )
              ],
            ),
          ),
          actions: <Widget>[
            StreamBuilder(
                stream: streamAlertOutput,
                builder: (context, snapshot) {
                  return TextButton(
                    child: snapshot.data ? Text('') : Text('Ver mensagem'),
                    onPressed: () {
    
                      Navigator.of(context).pop();
                    },
                  );
                }),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          homeController.getIdSms(widget.smsInfo.id);
          desabeldButton = true;
          streamAlertInput.add(desabeldButton);
          showMyDialog(context);
          Future.delayed(Duration(seconds: 5), () {
            desabeldButton = false;
            streamAlertInput.add(desabeldButton);
            
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.smsInfo.title,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              SvgPicture.asset(
                widget.smsInfo.image,
                height: 40,
                color: desabeldButton ? Colors.grey : null,
              ),
              Text(
                widget.smsInfo.description,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
