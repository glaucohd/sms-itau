import 'package:flutter/material.dart';
import 'package:sms_maintained/sms.dart';

class HomeController {
  void getIdSms(String id) {
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

  //SALDO DA CONTA
  void accountBalance() {
    SmsSender sender = SmsSender();
    String address = "4828";

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
    SmsSender sender = SmsSender();
    String address = "4828";

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
    SmsSender sender = SmsSender();
    String address = "4828";

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
    SmsSender sender = SmsSender();
    String address = "4828";

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
    SmsSender sender = SmsSender();
    String address = "4828";

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
    SmsSender sender = SmsSender();
    String address = "4828";

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
    SmsSender sender = SmsSender();
    String address = "4828";

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

  
}
