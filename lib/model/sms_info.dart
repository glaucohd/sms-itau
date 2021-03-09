import 'package:flutter/foundation.dart';

class SmsInfo {
  @required final String id;
  @required final String title;
  @required final String description;
  @required final String image;

  SmsInfo({
    this.id,
    this.title,
    this.description,
    this.image,
  });
}
