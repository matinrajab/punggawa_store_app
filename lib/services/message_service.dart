import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoe_store_app/models/message_model.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/models/uninitialized_product_model.dart';
import 'package:shoe_store_app/models/user_model.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<MessageModel>> getMessagesByUserId({int? userId}) {
    CollectionReference messages = firestore.collection('messages');
    try {
      return messages
          .where('user_id', isEqualTo: userId)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<MessageModel>((DocumentSnapshot message) {
          print(message.data());
          return MessageModel.fromJson(message.data() as Map<String, dynamic>);
        }).toList();
        result.sort(
          (MessageModel a, MessageModel b) =>
              a.createdAt!.compareTo(b.createdAt!),
        );

        return result;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addMessage({
    UserModel? user,
    bool? isFromUser,
    String? message,
    ProductModel? product,
  }) async {
    try {
      firestore.collection('messages').add({
        'user_id': user!.id,
        'user_name': user.name,
        'user_image': user.profilePhotoUrl,
        'is_from_user': isFromUser,
        'message': message,
        'product':
            product is UninitializedProductModel ? {} : product!.toJson(),
        'created_at': DateTime.now().toString(),
        'updated_at': DateTime.now().toString(),
      }).then(
        (value) => print('Pesan Berhasil Dikirim!'),
      );
    } catch (e) {
      throw Exception('Pesan Gagal Dikirim!');
    }
  }
}
