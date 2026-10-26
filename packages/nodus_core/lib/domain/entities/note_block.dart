import 'package:equatable/equatable.dart';

/// Sealed class hierarchy representing all polymorphic note blocks in Nodus.
sealed class NoteBlock extends Equatable {
  final String id;
  final String pageId;
  final double sortOrder;
  final String? crdtStateBase64;

  const NoteBlock({
    required this.id,
    required this.pageId,
    required this.sortOrder,
    this.crdtStateBase64,
  });

  /// String identifier matching the database `block_type` column.
  String get blockType;

  /// Serializes block content and metadata into JSON.
  Map<String, dynamic> toJson();

  /// Deserializes a polymorphic [NoteBlock] from JSON.
  factory NoteBlock.fromJson(Map<String, dynamic> json) {
    final type = json['blockType'] as String? ?? 'text';
    return switch (type) {
      'text' => TextBlock.fromJson(json),
      'heading' => HeadingBlock.fromJson(json),
      'code' => CodeBlock.fromJson(json),
      'terminal' => TerminalBlock.fromJson(json),
      'image' => ImageBlock.fromJson(json),
      'task' => TaskBlock.fromJson(json),
      'vault' => VaultBlock.fromJson(json),
      _ => TextBlock.fromJson(json),
    };
  }

  @override
  List<Object?> get props => [id, pageId, sortOrder, crdtStateBase64];
}

/// Standard text block with markdown inline token support.
final class TextBlock extends NoteBlock {
  final String text;

  const TextBlock({
    required super.id,
    required super.pageId,
    required super.sortOrder,
    super.crdtStateBase64,
    this.text = '',
  });

  @override
  String get blockType => 'text';

  TextBlock copyWith({
    String? id,
    String? pageId,
    double? sortOrder,
    String? crdtStateBase64,
    String? text,
  }) {
    return TextBlock(
      id: id ?? this.id,
      pageId: pageId ?? this.pageId,
      sortOrder: sortOrder ?? this.sortOrder,
      crdtStateBase64: crdtStateBase64 ?? this.crdtStateBase64,
      text: text ?? this.text,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'pageId': pageId,
        'blockType': blockType,
        'sortOrder': sortOrder,
        'crdtStateBase64': crdtStateBase64,
        'text': text,
      };

  factory TextBlock.fromJson(Map<String, dynamic> json) => TextBlock(
        id: json['id'] as String,
        pageId: json['pageId'] as String,
        sortOrder: (json['sortOrder'] as num).toDouble(),
        crdtStateBase64: json['crdtStateBase64'] as String?,
        text: json['text'] as String? ?? '',
      );

  @override
  List<Object?> get props => [...super.props, text];
}

/// Heading block (H1, H2, H3).
final class HeadingBlock extends NoteBlock {
  final int level;
  final String text;

  const HeadingBlock({
    required super.id,
    required super.pageId,
    required super.sortOrder,
    super.crdtStateBase64,
    this.level = 1,
    this.text = '',
  });

  @override
  String get blockType => 'heading';

  HeadingBlock copyWith({
    String? id,
    String? pageId,
    double? sortOrder,
    String? crdtStateBase64,
    int? level,
    String? text,
  }) {
    return HeadingBlock(
      id: id ?? this.id,
      pageId: pageId ?? this.pageId,
      sortOrder: sortOrder ?? this.sortOrder,
      crdtStateBase64: crdtStateBase64 ?? this.crdtStateBase64,
      level: level ?? this.level,
      text: text ?? this.text,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'pageId': pageId,
        'blockType': blockType,
        'sortOrder': sortOrder,
        'crdtStateBase64': crdtStateBase64,
        'level': level,
        'text': text,
      };

  factory HeadingBlock.fromJson(Map<String, dynamic> json) => HeadingBlock(
        id: json['id'] as String,
        pageId: json['pageId'] as String,
        sortOrder: (json['sortOrder'] as num).toDouble(),
        crdtStateBase64: json['crdtStateBase64'] as String?,
        level: json['level'] as int? ?? 1,
        text: json['text'] as String? ?? '',
      );

  @override
  List<Object?> get props => [...super.props, level, text];
}

/// Syntax-highlighted code block.
final class CodeBlock extends NoteBlock {
  final String language;
  final String source;
  final bool stripPromptPrefixes;

  const CodeBlock({
    required super.id,
    required super.pageId,
    required super.sortOrder,
    super.crdtStateBase64,
    this.language = 'bash',
    this.source = '',
    this.stripPromptPrefixes = true,
  });

  @override
  String get blockType => 'code';

  CodeBlock copyWith({
    String? id,
    String? pageId,
    double? sortOrder,
    String? crdtStateBase64,
    String? language,
    String? source,
    bool? stripPromptPrefixes,
  }) {
    return CodeBlock(
      id: id ?? this.id,
      pageId: pageId ?? this.pageId,
      sortOrder: sortOrder ?? this.sortOrder,
      crdtStateBase64: crdtStateBase64 ?? this.crdtStateBase64,
      language: language ?? this.language,
      source: source ?? this.source,
      stripPromptPrefixes: stripPromptPrefixes ?? this.stripPromptPrefixes,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'pageId': pageId,
        'blockType': blockType,
        'sortOrder': sortOrder,
        'crdtStateBase64': crdtStateBase64,
        'language': language,
        'source': source,
        'stripPromptPrefixes': stripPromptPrefixes,
      };

  factory CodeBlock.fromJson(Map<String, dynamic> json) => CodeBlock(
        id: json['id'] as String,
        pageId: json['pageId'] as String,
        sortOrder: (json['sortOrder'] as num).toDouble(),
        crdtStateBase64: json['crdtStateBase64'] as String?,
        language: json['language'] as String? ?? 'bash',
        source: json['source'] as String? ?? '',
        stripPromptPrefixes: json['stripPromptPrefixes'] as bool? ?? true,
      );

  @override
  List<Object?> get props => [...super.props, language, source, stripPromptPrefixes];
}

/// ANSI 256-color terminal log block.
final class TerminalBlock extends NoteBlock {
  final String command;
  final String output;
  final int? exitCode;
  final String? executionTime;

  const TerminalBlock({
    required super.id,
    required super.pageId,
    required super.sortOrder,
    super.crdtStateBase64,
    this.command = '',
    this.output = '',
    this.exitCode,
    this.executionTime,
  });

  @override
  String get blockType => 'terminal';

  TerminalBlock copyWith({
    String? id,
    String? pageId,
    double? sortOrder,
    String? crdtStateBase64,
    String? command,
    String? output,
    int? exitCode,
    String? executionTime,
  }) {
    return TerminalBlock(
      id: id ?? this.id,
      pageId: pageId ?? this.pageId,
      sortOrder: sortOrder ?? this.sortOrder,
      crdtStateBase64: crdtStateBase64 ?? this.crdtStateBase64,
      command: command ?? this.command,
      output: output ?? this.output,
      exitCode: exitCode ?? this.exitCode,
      executionTime: executionTime ?? this.executionTime,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'pageId': pageId,
        'blockType': blockType,
        'sortOrder': sortOrder,
        'crdtStateBase64': crdtStateBase64,
        'command': command,
        'output': output,
        'exitCode': exitCode,
        'executionTime': executionTime,
      };

  factory TerminalBlock.fromJson(Map<String, dynamic> json) => TerminalBlock(
        id: json['id'] as String,
        pageId: json['pageId'] as String,
        sortOrder: (json['sortOrder'] as num).toDouble(),
        crdtStateBase64: json['crdtStateBase64'] as String?,
        command: json['command'] as String? ?? '',
        output: json['output'] as String? ?? '',
        exitCode: json['exitCode'] as int?,
        executionTime: json['executionTime'] as String?,
      );

  @override
  List<Object?> get props => [...super.props, command, output, exitCode, executionTime];
}

/// CAS binary image attachment block.
final class ImageBlock extends NoteBlock {
  final String blobHash;
  final String altText;
  final double? width;
  final String format;

  const ImageBlock({
    required super.id,
    required super.pageId,
    required super.sortOrder,
    super.crdtStateBase64,
    required this.blobHash,
    this.altText = '',
    this.width,
    this.format = 'webp',
  });

  @override
  String get blockType => 'image';

  ImageBlock copyWith({
    String? id,
    String? pageId,
    double? sortOrder,
    String? crdtStateBase64,
    String? blobHash,
    String? altText,
    double? width,
    String? format,
  }) {
    return ImageBlock(
      id: id ?? this.id,
      pageId: pageId ?? this.pageId,
      sortOrder: sortOrder ?? this.sortOrder,
      crdtStateBase64: crdtStateBase64 ?? this.crdtStateBase64,
      blobHash: blobHash ?? this.blobHash,
      altText: altText ?? this.altText,
      width: width ?? this.width,
      format: format ?? this.format,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'pageId': pageId,
        'blockType': blockType,
        'sortOrder': sortOrder,
        'crdtStateBase64': crdtStateBase64,
        'blobHash': blobHash,
        'altText': altText,
        'width': width,
        'format': format,
      };

  factory ImageBlock.fromJson(Map<String, dynamic> json) => ImageBlock(
        id: json['id'] as String,
        pageId: json['pageId'] as String,
        sortOrder: (json['sortOrder'] as num).toDouble(),
        crdtStateBase64: json['crdtStateBase64'] as String?,
        blobHash: json['blobHash'] as String,
        altText: json['altText'] as String? ?? '',
        width: (json['width'] as num?)?.toDouble(),
        format: json['format'] as String? ?? 'webp',
      );

  @override
  List<Object?> get props => [...super.props, blobHash, altText, width, format];
}

/// Inline interactive task block.
final class TaskBlock extends NoteBlock {
  final String rawText;
  final bool isCompleted;

  const TaskBlock({
    required super.id,
    required super.pageId,
    required super.sortOrder,
    super.crdtStateBase64,
    this.rawText = '',
    this.isCompleted = false,
  });

  @override
  String get blockType => 'task';

  TaskBlock copyWith({
    String? id,
    String? pageId,
    double? sortOrder,
    String? crdtStateBase64,
    String? rawText,
    bool? isCompleted,
  }) {
    return TaskBlock(
      id: id ?? this.id,
      pageId: pageId ?? this.pageId,
      sortOrder: sortOrder ?? this.sortOrder,
      crdtStateBase64: crdtStateBase64 ?? this.crdtStateBase64,
      rawText: rawText ?? this.rawText,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'pageId': pageId,
        'blockType': blockType,
        'sortOrder': sortOrder,
        'crdtStateBase64': crdtStateBase64,
        'rawText': rawText,
        'isCompleted': isCompleted,
      };

  factory TaskBlock.fromJson(Map<String, dynamic> json) => TaskBlock(
        id: json['id'] as String,
        pageId: json['pageId'] as String,
        sortOrder: (json['sortOrder'] as num).toDouble(),
        crdtStateBase64: json['crdtStateBase64'] as String?,
        rawText: json['rawText'] as String? ?? '',
        isCompleted: json['isCompleted'] as bool? ?? false,
      );

  @override
  List<Object?> get props => [...super.props, rawText, isCompleted];
}

/// Client-side encrypted vault block.
final class VaultBlock extends NoteBlock {
  final String encryptedPayload;
  final String hint;
  final String algorithm;

  const VaultBlock({
    required super.id,
    required super.pageId,
    required super.sortOrder,
    super.crdtStateBase64,
    required this.encryptedPayload,
    this.hint = 'Vault Secret',
    this.algorithm = 'AES-256-GCM',
  });

  @override
  String get blockType => 'vault';

  VaultBlock copyWith({
    String? id,
    String? pageId,
    double? sortOrder,
    String? crdtStateBase64,
    String? encryptedPayload,
    String? hint,
    String? algorithm,
  }) {
    return VaultBlock(
      id: id ?? this.id,
      pageId: pageId ?? this.pageId,
      sortOrder: sortOrder ?? this.sortOrder,
      crdtStateBase64: crdtStateBase64 ?? this.crdtStateBase64,
      encryptedPayload: encryptedPayload ?? this.encryptedPayload,
      hint: hint ?? this.hint,
      algorithm: algorithm ?? this.algorithm,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'pageId': pageId,
        'blockType': blockType,
        'sortOrder': sortOrder,
        'crdtStateBase64': crdtStateBase64,
        'encryptedPayload': encryptedPayload,
        'hint': hint,
        'algorithm': algorithm,
      };

  factory VaultBlock.fromJson(Map<String, dynamic> json) => VaultBlock(
        id: json['id'] as String,
        pageId: json['pageId'] as String,
        sortOrder: (json['sortOrder'] as num).toDouble(),
        crdtStateBase64: json['crdtStateBase64'] as String?,
        encryptedPayload: json['encryptedPayload'] as String,
        hint: json['hint'] as String? ?? 'Vault Secret',
        algorithm: json['algorithm'] as String? ?? 'AES-256-GCM',
      );

  @override
  List<Object?> get props => [...super.props, encryptedPayload, hint, algorithm];
}
