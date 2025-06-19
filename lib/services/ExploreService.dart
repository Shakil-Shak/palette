import 'package:palette/models/explore/ExploreResponseModel.dart';
import 'package:palette/services/api_service.dart';
import 'package:palette/utils/api_endpoints.dart';

class ExploreService {
  final ApiService apiService = ApiService();

  Future<ExploreResponseModel> fetchExploreList({String? search}) async {
    String url = ApiEndpoints.exploreList;

    if (search != null && search.isNotEmpty) {
      url += '?search=$search';
    }

    final jsonResponse = await apiService.get(url);
    return ExploreResponseModel.fromJson(jsonResponse);
  }
}
