import 'package:airplane/models/destination.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DestinationService {
  final CollectionReference destinationRef =
      FirebaseFirestore.instance.collection('destination');

  Future<List<DestinationModel>> fetchDestination() async {
    try {
      QuerySnapshot querySnapshot = await destinationRef.get();

      List<DestinationModel> destinations = querySnapshot.docs.map((e) {
        return DestinationModel.fromJson(
            e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return destinations;
    } catch (e) {
      throw e;
    }
  }
}
