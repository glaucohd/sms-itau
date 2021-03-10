import 'package:flutter/material.dart';
import 'package:sms_itau/data/dummy_data.dart';
import 'package:sms_itau/model/sms_info.dart';
import 'package:sms_itau/widgets/sms_item.dart';

class HomeView extends StatelessWidget {
  final List<SmsInfo> loadedSmsInfo = DUMMY_SMS_INFO;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Serviço de SMS do banco Itaú'),
        centerTitle: true,
        backgroundColor: Color(0xffEC7002),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        itemCount: loadedSmsInfo.length,
        itemBuilder: (context, index) => SmsItem(loadedSmsInfo[index]),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4/3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
        ),
      ),
    );
  }
}
