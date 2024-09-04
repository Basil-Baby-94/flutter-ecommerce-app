import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CustomCacheManager extends CacheManager {
  static const key = 'customCache';

  CustomCacheManager()
      : super(
          Config(
            key,
            stalePeriod:
                const Duration(days: 7), // Duration to keep data in cache
            maxNrOfCacheObjects: 20, // Maximum number of cache objects
            repo: JsonCacheInfoRepository(databaseName: key), // Cache database
          ),
        );
}
