import 'package:equatable/equatable.dart';

class HistoryItem<T> extends Equatable {
  HistoryItem({
    required this.id,
    required this.userId,
    required this.userName,
    required this.origin,
    required this.type,
    required this.description,
    required this.details,
    required this.item,
    required this.itemId,
  }) : this.date = DateTime.now().millisecond;

  HistoryItem<T> copyWith({
    int? id,
    int? date,
    int? userId,
    String? userName,
    String? origin,
    String? type,
    String? description,
    String? details,
    T? item,
    int? itemId,
  }) {
    return HistoryItem(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      origin: origin ?? this.origin,
      type: type ?? this.type,
      description: description ?? this.description,
      details: details ?? this.details,
      item: item ?? this.item,
      itemId: itemId ?? this.itemId,
    );
  }

  final int id;

  /// Date created in `milliseconds`
  final int date;
  final int userId;
  final String userName;
  final String origin;
  final String type;
  final String description;
  final String details;
  final T item;
  final int itemId;

  @override
  // Equality comparison
  List<Object?> get props => [
        id,
        userId,
        userName,
        origin,
        type,
        description,
        details,
        item,
        itemId,
      ];
}
