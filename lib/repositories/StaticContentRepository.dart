// lib/repositories/static_content_repository.dart
import 'package:palette/models/user%20models/static_content_model.dart';
import 'package:palette/services/StaticContentService.dart';

class StaticContentRepository {
  final StaticContentService staticContentService;

  StaticContentRepository(this.staticContentService);

  Future<StaticContentResponse> getStaticContent(String type) async {
    final jsonResponse = await staticContentService.fetchStaticContent(type);
    return StaticContentResponse.fromJson(jsonResponse);
  }
}
