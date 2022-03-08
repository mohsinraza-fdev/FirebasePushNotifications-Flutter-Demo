import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastfood_menu_app/models/deal_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppFirestoreService {
  final _firestoreInstace = FirebaseFirestore.instance;

  Future<List<Deal>> getDealsFromFirestore() async {
    try {
      List<Deal> deals = <Deal>[];
      final CollectionReference firestoreDeals =
          _firestoreInstace.collection('Deals');
      await firestoreDeals.orderBy('index').get().then((snapshot) {
        for (DocumentSnapshot ds in snapshot.docs) {
          deals.add(Deal(
              index: ds.get('index'),
              items: ds.get('items'),
              price: ds.get('price')));
        }
      });
      return deals;
    } catch (e) {
      throw (e.toString());
    }
  }

  getDealFromIndex(int index) async {
    try {
      Deal? output;
      final CollectionReference firestoreDeals =
          _firestoreInstace.collection('Deals');
      final querySnapshot =
          await firestoreDeals.where('index', isEqualTo: index).get();
      for (var doc in querySnapshot.docs) {
        output = Deal(
            index: doc.get('index'),
            items: doc.get('items'),
            price: doc.get('price'));
        break;
      }
      if (output != null) {
        return output;
      } else {
        throw ('Error');
      }
    } catch (e) {
      throw (e.toString());
    }
  }
}
