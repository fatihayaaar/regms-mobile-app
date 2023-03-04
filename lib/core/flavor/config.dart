enum Flavor {
  development,
  admin,
  release,
}

class Config {
  static late Flavor appFlavor;
}
