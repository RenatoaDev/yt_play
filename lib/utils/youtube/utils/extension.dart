extension GetOrNullMap on Map {
  Map<String, dynamic>? get(String key) {
    var v = this[key];
    if (v == null) {
      return null;
    }
    return v;
  }

  T? getT<T>(String key) {
    var v = this[key];
    if (v == null) {
      return null;
    }
    if (v is! T) {
      throw Exception('Invalid type: ${v.runtimeType} should be $T');
    }
    return v;
  }

  List<Map<String, dynamic>>? getList(String key) {
    var v = this[key];
    if (v == null) {
      return null;
    }
    if (v is! List<dynamic>) {
      throw Exception('Invalid type: ${v.runtimeType} should be of type List');
    }

    return (v.toList()).cast<Map<String, dynamic>>();
  }
}

extension ListUtil<E> on Iterable<E> {
  E? elementAtSafe(int index) {
    if (index >= length) {
      return null;
    }
    return elementAt(index);
  }
}
