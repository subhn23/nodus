import 'package:test/test.dart';
import 'package:nodus_core/domain/utils/hlc.dart';

void main() {
  group('Hybrid Logical Clock (Hlc)', () {
    test('creates and encodes monotonically sortable strings', () {
      final hlc1 = Hlc(millis: 1000, counter: 0, nodeId: 'device-a');
      final hlc2 = Hlc(millis: 1000, counter: 1, nodeId: 'device-a');
      final hlc3 = Hlc(millis: 1001, counter: 0, nodeId: 'device-a');

      expect(hlc1.compareTo(hlc2), lessThan(0));
      expect(hlc2.compareTo(hlc3), lessThan(0));

      final enc1 = hlc1.encode();
      final enc2 = hlc2.encode();
      final enc3 = hlc3.encode();

      expect(enc1.compareTo(enc2), lessThan(0));
      expect(enc2.compareTo(enc3), lessThan(0));
    });

    test('decodes encoded string preserving exact values', () {
      final original = Hlc(millis: 1729987200000, counter: 42, nodeId: 'node-xyz');
      final encoded = original.encode();
      final decoded = Hlc.decode(encoded);

      expect(decoded, equals(original));
      expect(decoded.millis, equals(1729987200000));
      expect(decoded.counter, equals(42));
      expect(decoded.nodeId, equals('node-xyz'));
    });

    test('increment bumps counter if wall clock has not advanced', () {
      final hlc = Hlc(millis: 5000, counter: 0, nodeId: 'device-a');
      final next = hlc.increment(wallClockMillis: 5000);

      expect(next.millis, equals(5000));
      expect(next.counter, equals(1));
    });

    test('increment resets counter when wall clock advances', () {
      final hlc = Hlc(millis: 5000, counter: 5, nodeId: 'device-a');
      final next = hlc.increment(wallClockMillis: 6000);

      expect(next.millis, equals(6000));
      expect(next.counter, equals(0));
    });

    test('receive merges causal order from peer device', () {
      final local = Hlc(millis: 2000, counter: 1, nodeId: 'device-local');
      final remote = Hlc(millis: 3000, counter: 4, nodeId: 'device-remote');

      final merged = local.receive(remote, wallClockMillis: 2500);

      expect(merged.millis, equals(3000));
      expect(merged.counter, equals(5));
      expect(merged.nodeId, equals('device-local'));
    });
  });
}
