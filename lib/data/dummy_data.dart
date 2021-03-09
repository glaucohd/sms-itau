import '../model/sms_info.dart';

final DUMMY_SMS_INFO = [
  SmsInfo(
    id:'1',
    title:'Saldo da conta',
    description:'Saldo da conta corrente',
    image: 'assets/images/dollar-sign-solid.svg',
  ),
  SmsInfo(
    id:'2',
    title:'Extrato',
    description:'Extrato com os 3 últimos lançamentos da conta corrente',
    image: 'assets/images/receipt-solid.svg',
  ),
  SmsInfo(
    id:'3',
    title:'Lanc Futuros',
    description:'Extrato  com os 3 próximos lançamentos futuros da conta corrente',
    image: 'assets/images/chart-line-solid.svg',
  ),
  SmsInfo(
    id:'4',
    title:'Saldo poupança',
    description:'Saldo da poupança',
    image: 'assets/images/piggy-bank-solid.svg',
  ),
  SmsInfo(
    id:'5',
    title:'Limite ',
    description:'Valor dísponível para gastar no cartão',
    image: 'assets/images/wallet-solid.svg',
  ),
  SmsInfo(
    id:'6',
    title:'Lancamentos',
    description:'Últimos lançamentos do mês na fatura do cartão',
    image: 'assets/images/credit-card-solid.svg',
  ),
  SmsInfo(
    id:'7',
    title:'Melhor data',
    description:'Melhor data de compra do seu cartão',
    image: 'assets/images/calendar-check-solid.svg',
  ),
];
