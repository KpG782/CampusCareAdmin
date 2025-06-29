import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuoteGeneratorRecord extends FirestoreRecord {
  QuoteGeneratorRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  bool hasAuthor() => _author != null;

  // "quote" field.
  String? _quote;
  String get quote => _quote ?? '';
  bool hasQuote() => _quote != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  void _initializeFields() {
    _author = snapshotData['author'] as String?;
    _quote = snapshotData['quote'] as String?;
    _category = snapshotData['category'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quoteGenerator');

  static Stream<QuoteGeneratorRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuoteGeneratorRecord.fromSnapshot(s));

  static Future<QuoteGeneratorRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuoteGeneratorRecord.fromSnapshot(s));

  static QuoteGeneratorRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuoteGeneratorRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuoteGeneratorRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuoteGeneratorRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuoteGeneratorRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuoteGeneratorRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuoteGeneratorRecordData({
  String? author,
  String? quote,
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'author': author,
      'quote': quote,
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuoteGeneratorRecordDocumentEquality
    implements Equality<QuoteGeneratorRecord> {
  const QuoteGeneratorRecordDocumentEquality();

  @override
  bool equals(QuoteGeneratorRecord? e1, QuoteGeneratorRecord? e2) {
    return e1?.author == e2?.author &&
        e1?.quote == e2?.quote &&
        e1?.category == e2?.category;
  }

  @override
  int hash(QuoteGeneratorRecord? e) =>
      const ListEquality().hash([e?.author, e?.quote, e?.category]);

  @override
  bool isValidKey(Object? o) => o is QuoteGeneratorRecord;
}
