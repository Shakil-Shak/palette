import 'package:palette/models/explore/ExploreResponseModel.dart';
import 'package:palette/services/ExploreService.dart';

class ExploreRepository {
  final ExploreService _exploreService = ExploreService();

  Future<ExploreResponseModel> getExploreData({String? search}) {
    return _exploreService.fetchExploreList(search: search);
  }
}
