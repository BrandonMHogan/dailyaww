import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

/// Handles image loading and caching, so that the cache manager
/// can be shared between all views.
class ImageService {
  /// The default cache used for caching all images and files
  static final BaseCacheManager _baseCacheManager = DefaultCacheManager();

  /// public read only for the default cache
  static BaseCacheManager getCacheManager() {
    return _baseCacheManager;
  }

  /// will cache the image and return the Image widget with progress indicator
  static CachedNetworkImage cacheImage(String url) {
    return CachedNetworkImage(
      // stores into the base cache manager
      cacheManager: _baseCacheManager,
      imageUrl: url,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      // TODO: Look into adding a callback so that the view can handle failed loads
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
