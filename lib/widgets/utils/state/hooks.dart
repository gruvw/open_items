import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useListener(void Function() listener, List<Listenable> listenables) {
  useEffect(() {
    final listenable = Listenable.merge(listenables);
    listenable.addListener(listener);

    return () => listenable.removeListener(listener);
  }, listenables);
}
