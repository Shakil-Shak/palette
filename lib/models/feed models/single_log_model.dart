import 'package:palette/models/common_models.dart';

class SingleLogModel {
  final String status;
  final int statusCode;
  final String type;
  final String message;
  final LogEntry data;

  SingleLogModel({
    required this.status,
    required this.statusCode,
    required this.type,
    required this.message,
    required this.data,
  });

  factory SingleLogModel.fromJson(Map<String, dynamic> json) {
    return SingleLogModel(
      status: json['status'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      type: json['type'] ?? '',
      message: json['message'] ?? '',
      data: LogEntry.fromJson(json['data'] ?? {}),
    );
  }
}
