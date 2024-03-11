class ReturnData<T> {
  final bool success;
  final String? message;
  final T? data;

  ReturnData({
    required this.success,
    required this.message,
    this.data,
  });
}
