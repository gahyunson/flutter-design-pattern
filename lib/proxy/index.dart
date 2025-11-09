abstract class ThirdPartyYoTubeLib {
  List listVideos();
  Map<String, dynamic> getVideoInfo(String id);
  void downloadVideo(id);
}

class ThirdPartyYouTubeClass implements ThirdPartyYoTubeLib {
  @override
  List listVideos() {
    print("Send an API request to YouTube.");
    return [];
  }

  @override
  Map<String, dynamic> getVideoInfo(String id) {
    print("Get metadata from video.");
    return {'id': id, 'title': '오사카 여행 브이로그'};
  }

  @override
  void downloadVideo(id) {
    print("Download video.");
  }
}

class CachedYouTubeClass implements ThirdPartyYoTubeLib {
  final ThirdPartyYoTubeLib _service;
  List? _listCache;
  Map<String, dynamic> _videoCache = {};
  bool needReset = false;

  CachedYouTubeClass(this._service);

  @override
  List listVideos() {
    if (_listCache == null || needReset) {
      _listCache = _service.listVideos();
    } else {
      print('Returning cached list');
    }
    return _listCache!;
  }

  @override
  Map<String, dynamic> getVideoInfo(id) {
    if (_videoCache['id'] != id || needReset) {
      print('Cache miss for video info ($id),,,');
      _videoCache = _service.getVideoInfo(id);
    } else {
      print('Returning cached video info');
    }
    return _videoCache;
  }

  @override
  void downloadVideo(id) {
    if (needReset) {
      _service.downloadVideo(id);
    }
  }
}

class YouTubeManager {
  final ThirdPartyYoTubeLib service;

  YouTubeManager(this.service);

  void renderVideoPage(id) {
    final info = service.getVideoInfo(id);
    print('Rendering video page: $info');
  }

  void renderListPanel() {
    final list = service.listVideos();
    print('Rendering list panel: $list');
  }

  void reactOnUserInput() {
    renderListPanel();
    renderVideoPage('1');
  }
}

class Application {
  void init() {
    ThirdPartyYouTubeClass aYouTubeService = ThirdPartyYouTubeClass();
    CachedYouTubeClass aYouTubeProxy = CachedYouTubeClass(aYouTubeService);
    YouTubeManager manager = YouTubeManager(aYouTubeProxy);
    manager.reactOnUserInput();
    print('\n--- Simulate second request (cached) ---');
    manager.reactOnUserInput();
  }
}

// Declare the interface of the service
// The proxy must follow this interface
class ServiceInterface {
  void operation() {
    print('Service interface operation Run');
  }
}

// Declare business logic
class Service {
  void operation() {
    print('고객님 어서오십시오. 따끈한 물에 목욕 어떠세요?');
  }
}

// Proxy class has a reference field
// A reference field points to a service object
// It passes the request to the service object
// Manage the full lifecycle of the service object
class Proxy implements Service {
  Service realService;

  Proxy(this.realService);

  bool checkAccess() {
    print('Proxy is checking access');
    return true;
  }

  void operation() {
    if (checkAccess()) {
      realService.operation();
    }
  }
}
