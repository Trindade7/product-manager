import 'package:objectbox/objectbox.dart';
import '../models/models.dart';

@Entity() //Used by Obectbox. //? TODO: Better implementation?
class HistoryItemAdapter<T> {
  HistoryItemAdapter({
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

  int id;

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

  static HistoryItemAdapter<T> fromHistoryItem<T>(HistoryItem<T> item) {
    return HistoryItemAdapter<T>(
      id: item.id,
      userId: item.userId,
      userName: item.userName,
      origin: item.origin,
      type: item.type,
      description: item.description,
      details: item.details,
      item: item.item,
      itemId: item.itemId,
    );
  }

  static HistoryItem<T> toHistoryItem<T>(HistoryItemAdapter<T> item) {
    return HistoryItem<T>(
      id: item.id,
      userId: item.userId,
      userName: item.userName,
      origin: item.origin,
      type: item.type,
      description: item.description,
      details: item.details,
      item: item.item,
      itemId: item.itemId,
    );
  }
}
