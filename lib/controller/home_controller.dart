import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sms_maintained/sms.dart';

class HomeController {
  List bodyMessage = [];
  String address = "4828";
  String digitsCard;

  final sender = SmsSender();
  final StreamController streamAlert = StreamController.broadcast();
  TextEditingController digitsCardController = TextEditingController();

  Sink get streamAlertInput => streamAlert.sink;
  Stream get streamAlertOutput => streamAlert.stream;

  void dispose() {
    streamAlert.close();
  }

  void selectedServoceSms(String id) {
    switch (id) {
      case '1':
        accountBalance();
        break;
      case '2':
        accountStatement();
        break;
      case '3':
        futureRelease();
        break;
      case '4':
        savingsBalance();
        break;
      case '5':
        limits();
        break;
      case '6':
        lastEntriesMonthCard();
        break;
      case '7':
        bestDate();
        break;
      default:
    }
  }

  //INTERCEPTA SMS RECEBIDO
  void getSmsMessage(context) {
    SmsReceiver receiver = new SmsReceiver();
    receiver.onSmsReceived.listen((SmsMessage msg) {
      bodyMessage.add(msg.body);

      streamAlertInput.add(bodyMessage);

      print(bodyMessage);
    });

    showMyDialog(context, null);
  }

  //SALDO DA CONTA
  void accountBalance() {
    SmsMessage message = SmsMessage(address, 'Saldo conta');
    message.onStateChanged.listen((state) {
      if (state == SmsMessageState.Sent) {
        print("SMS is sent!");
      } else if (state == SmsMessageState.Delivered) {
        print("SMS is delivered!");
      }
    });
    sender.sendSms(message);
  }

  //EXTRATO DA CONTA
  void accountStatement() {
    SmsMessage message = SmsMessage(address, 'Extrato');
    message.onStateChanged.listen((state) {
      if (state == SmsMessageState.Sent) {
        print("SMS is sent!");
      } else if (state == SmsMessageState.Delivered) {
        print("SMS is delivered!");
      }
    });
    sender.sendSms(message);
  }

  //LANÇAMENTOS FUTUROS
  void futureRelease() {
    SmsMessage message = SmsMessage(address, 'Lanc Futuros');
    message.onStateChanged.listen((state) {
      if (state == SmsMessageState.Sent) {
        print("SMS is sent!");
      } else if (state == SmsMessageState.Delivered) {
        print("SMS is delivered!");
      }
    });
    sender.sendSms(message);
  }

  void savingsBalance() {
    SmsMessage message = SmsMessage(address, 'Saldo poupança');
    message.onStateChanged.listen((state) {
      if (state == SmsMessageState.Sent) {
        print("SMS is sent!");
      } else if (state == SmsMessageState.Delivered) {
        print("SMS is delivered!");
      }
    });
    sender.sendSms(message);
  }

  //VALOR DÍSPONÍVEL PARA GASTAR NO CARTÃO
  void limits() {
    SmsMessage message = SmsMessage(address, 'Limite ');
    message.onStateChanged.listen((state) {
      if (state == SmsMessageState.Sent) {
        print("SMS is sent!");
      } else if (state == SmsMessageState.Delivered) {
        print("SMS is delivered!");
      }
    });
    sender.sendSms(message);
  }

  //ÚLTIMOS LANÇAMENTOS DO MÊS NA FATURA DO CARTÃO
  void lastEntriesMonthCard() {
    SmsMessage message = SmsMessage(address, 'Lancamentos ');
    message.onStateChanged.listen((state) {
      if (state == SmsMessageState.Sent) {
        print("SMS is sent!");
      } else if (state == SmsMessageState.Delivered) {
        print("SMS is delivered!");
      }
    });
    sender.sendSms(message);
  }

  //MELHOR DATA DE COMPRA DO SEU CARTÃO
  void bestDate() {
    SmsMessage message = SmsMessage(address, 'Melhor data ');
    message.onStateChanged.listen((state) {
      if (state == SmsMessageState.Sent) {
        print("SMS is sent!");
      } else if (state == SmsMessageState.Delivered) {
        print("SMS is delivered!");
      }
    });
    sender.sendSms(message);
  }

  Future<void> showMyDialog(context, bodyMessage) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return StreamBuilder(
          stream: streamAlertOutput,
          builder: (context, snapshot) {
            return AlertDialog(
              title: snapshot.data == null
                  ? Text(
                      'Só um instante',
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      'CHEGOU!!',
                      textAlign: TextAlign.center,
                    ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Column(
                      children: [
                        snapshot.data == null
                            ? CircularProgressIndicator()
                            : Text(snapshot.data.toString()),
                      ],
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                snapshot.data != null
                    ? TextButton(
                        child: Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    : null,
              ],
            );
          },
        );
      },
    );
  }
}
