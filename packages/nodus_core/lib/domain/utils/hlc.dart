import 'dart:math';

/// Hybrid Logical Clock (HLC) representing a causal timestamp
/// for distributed local-first CRDT synchronization.
class Hlc implements Comparable<Hlc> {
  final int millis;
  final int counter;
  final String nodeId;

  const Hlc({
    required this.millis,
    required this.counter,
    required this.nodeId,
  });

  /// Factory creating an initial HLC from current wall clock.
  factory Hlc.now({required String nodeId}) {
    return Hlc(
      millis: DateTime.now().toUtc().millisecondsSinceEpoch,
      counter: 0,
      nodeId: nodeId,
    );
  }

  /// Increments local clock ensuring monotonicity.
  Hlc increment({int? wallClockMillis}) {
    final physical = wallClockMillis ?? DateTime.now().toUtc().millisecondsSinceEpoch;
    if (physical > millis) {
      return Hlc(millis: physical, counter: 0, nodeId: nodeId);
    }
    return Hlc(millis: millis, counter: counter + 1, nodeId: nodeId);
  }

  /// Merges remote HLC ensuring causal ordering across devices.
  Hlc receive(Hlc remote, {int? wallClockMillis}) {
    final physical = wallClockMillis ?? DateTime.now().toUtc().millisecondsSinceEpoch;
    final maxMillis = max(physical, max(millis, remote.millis));

    if (maxMillis == millis && maxMillis == remote.millis) {
      return Hlc(millis: maxMillis, counter: max(counter, remote.counter) + 1, nodeId: nodeId);
    } else if (maxMillis == millis) {
      return Hlc(millis: maxMillis, counter: counter + 1, nodeId: nodeId);
    } else if (maxMillis == remote.millis) {
      return Hlc(millis: maxMillis, counter: remote.counter + 1, nodeId: nodeId);
    } else {
      return Hlc(millis: maxMillis, counter: 0, nodeId: nodeId);
    }
  }

  /// Encodes HLC into a lexicographically sortable ISO-like string.
  /// Format: `<millis_hex>:<counter_hex>:<node_id>`
  String encode() {
    final m = millis.toRadixString(16).padLeft(14, '0');
    final c = counter.toRadixString(16).padLeft(4, '0');
    return '$m:$c:$nodeId';
  }

  /// Decodes a string representation into an [Hlc].
  factory Hlc.decode(String encoded) {
    final parts = encoded.split(':');
    if (parts.length < 3) {
      throw FormatException('Invalid HLC string: $encoded');
    }
    final millis = int.parse(parts[0], radix: 16);
    final counter = int.parse(parts[1], radix: 16);
    final nodeId = parts.sublist(2).join(':');
    return Hlc(millis: millis, counter: counter, nodeId: nodeId);
  }

  @override
  int compareTo(Hlc other) {
    if (millis != other.millis) return millis.compareTo(other.millis);
    if (counter != other.counter) return counter.compareTo(other.counter);
    return nodeId.compareTo(other.nodeId);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Hlc &&
          runtimeType == other.runtimeType &&
          millis == other.millis &&
          counter == other.counter &&
          nodeId == other.nodeId;

  @override
  int get hashCode => millis.hashCode ^ counter.hashCode ^ nodeId.hashCode;

  @override
  String toString() => encode();
}
