class ServiceLocator {
  static final Map<Type, Object> _singletons = {};
  static final Map<Type, Object? Function()> _factories = {};

  ServiceLocator._();

  static void registerSingleton<T>(T instance) {
    _singletons[T] = instance as Object;
  }

  static void registerFactory<T>(T Function() factory) {
    _factories[T] = factory as Object? Function();
  }

  static bool contains<T>() {
    return _singletons.containsKey(T) || _factories.containsKey(T);
  }

  static T get<T>() {
    final object = _resolve(T);
    if (object is T) {
      return object;
    }
    throw StateError('No registered dependency for type $T');
  }

  static Object? tryGet(Type type) => _resolve(type);

  static Object? _resolve(Type type) {
    if (_singletons.containsKey(type)) {
      return _singletons[type];
    }
    if (_factories.containsKey(type)) {
      return _factories[type]!();
    }
    return null;
  }

  static void clear() {
    _singletons.clear();
    _factories.clear();
  }
}
