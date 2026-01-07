enum Flavor {
  sidecar,
  remote,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.sidecar:
        return 'News Hub Sidecar';
      case Flavor.remote:
        return 'News Hub Remote';
      default:
        return 'title';
    }
  }

}
