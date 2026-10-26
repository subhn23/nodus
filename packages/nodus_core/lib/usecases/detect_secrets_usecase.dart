import '../domain/entities/note_block.dart';

/// Represents a detected credential or sensitive secret.
class SecretDetection {
  final String blockId;
  final String ruleName;
  final String matchedText;
  final String redactedSuggestion;

  const SecretDetection({
    required this.blockId,
    required this.ruleName,
    required this.matchedText,
    required this.redactedSuggestion,
  });
}

/// SecretGuard heuristic scanner detecting exposed credentials.
class DetectSecretsUseCase {
  static final _rules = <String, RegExp>{
    'AWS Access Key': RegExp(r'\bAKIA[0-9A-Z]{16}\b'),
    'GitHub Personal Access Token': RegExp(r'\b(ghp_[0-9a-zA-Z]{36}|github_pat_[0-9a-zA-Z_]{50,90})\b'),
    'SSH Private Key': RegExp(r'-----BEGIN (?:RSA|OPENSSH|EC|DSA|PGP) PRIVATE KEY-----'),
    'JSON Web Token': RegExp(r'\beyJ[a-zA-Z0-9_-]{10,}\.eyJ[a-zA-Z0-9_-]{10,}\.[a-zA-Z0-9_-]{10,}\b'),
    'Generic High-Entropy Secret': RegExp(
      r'''(?:api_key|apikey|secret|client_secret|access_token|bearer)\s*[:=]\s*["']([a-zA-Z0-9_\-]{20,})["']''',
      caseSensitive: false,
    ),
  };

  /// Scans provided [blocks] and returns all detected sensitive tokens.
  List<SecretDetection> execute(List<NoteBlock> blocks) {
    final detections = <SecretDetection>[];

    for (final block in blocks) {
      final textToScan = switch (block) {
        TextBlock(:final text) => text,
        CodeBlock(:final source) => source,
        TerminalBlock(:final command, :final output) => '$command\n$output',
        TaskBlock(:final rawText) => rawText,
        _ => '',
      };

      if (textToScan.isEmpty) continue;

      for (final entry in _rules.entries) {
        final matches = entry.value.allMatches(textToScan);
        for (final match in matches) {
          final matchedStr = match.group(0)!;
          final redacted = _redact(matchedStr);
          detections.add(SecretDetection(
            blockId: block.id,
            ruleName: entry.key,
            matchedText: matchedStr,
            redactedSuggestion: redacted,
          ));
        }
      }
    }

    return detections;
  }

  String _redact(String secret) {
    if (secret.length <= 8) {
      return '***REDACTED***';
    }
    final prefix = secret.substring(0, 4);
    final suffix = secret.substring(secret.length - 4);
    return '$prefix...${'*' * (secret.length - 8)}...$suffix';
  }
}
