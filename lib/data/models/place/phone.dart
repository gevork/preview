class Phone {
  const Phone({
    this.value,
    this.comment,
  });

  factory Phone.fromMap(Map<String, dynamic> json) => Phone(
    value: json['value'],
    comment:  json['comment'],
  );

  final String? value;
  final String? comment;

}