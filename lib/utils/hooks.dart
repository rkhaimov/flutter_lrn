import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rxdart/rxdart.dart';

T useBehaviorSubject<T>(BehaviorSubject<T> subject,
    {bool Function(T previous, T next)? selector}) {
  var select = selector ?? (_, __) => false;

  var snapshot = useStream(
      useMemoized(() => subject.distinct(select), [subject]),
      initialData: subject.value);

  return snapshot.data as T;
}

void useEffectObservable(Stream<Never> Function() effects) {
  useStream(useMemoized(effects));
}
