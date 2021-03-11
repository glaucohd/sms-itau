import 'package:flutter/material.dart';
import 'package:sms_itau/controller/home_controller.dart';
import '../model/sms_info.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SmsItem extends StatefulWidget {
  final SmsInfo smsInfo;
  SmsItem(this.smsInfo);

  @override
  _SmsItemState createState() => _SmsItemState();
}

class _SmsItemState extends State<SmsItem> {
  final homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          homeController.selectedServoceSms(widget.smsInfo.id);
          homeController.getSmsMessage(context);
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
                height: 30,
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
