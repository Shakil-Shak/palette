// lib/data/services/static_content_service.dart
import 'package:palette/utils/api_endpoints.dart';

import 'api_service.dart';

class StaticContentService {
  final ApiService apiService;

  StaticContentService(this.apiService);

  Future<dynamic> fetchStaticContent(String type) async {
    final response = await apiService.get(ApiEndpoints.staticContents(type));
    return response;
  }
}
