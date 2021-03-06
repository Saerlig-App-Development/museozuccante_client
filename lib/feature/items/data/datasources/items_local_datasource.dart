import 'package:floor/floor.dart';
import 'package:museo_zuccante/feature/items/data/models/item_local_model.dart';

@dao
abstract class ItemsLocalDatasource {
  @Query("SELECT * FROM items")
  Future<List<ItemLocalModel>> getItems();

  @Query('SELECT * FROM items WHERE id = :id')
  Future<ItemLocalModel> findItemById(String id);

  @Query('SELECT * FROM items WHERE room_id = :roomId')
  Future<List<ItemLocalModel>> getRoomItems(String roomId);

  @Query("SELECT * FROM items")
  Stream<List<ItemLocalModel>> watchAllItems();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertItem(ItemLocalModel item);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<List<int>> insertItems(List<ItemLocalModel> items);

  @Query('DELETE FROM items')
  Future<void> deleteAllItems();

  @delete
  Future<void> deleteItems(List<ItemLocalModel> items);

  @Query('UPDATE items SET bookmarked=1 WHERE id=:id')
  Future<void> bookmarkItem(String id);
}
