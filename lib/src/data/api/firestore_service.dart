import 'package:car_assistance/src/data/api/model/api_license_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/models/user_service.dart';
import 'model/api_affiliate_model.dart';
import 'model/api_rating_model.dart';

class FirestoreService {
  static const userCollection = "users";
  static const affiliateCollection = "affiliates";
  static const ratingCollection = "ratings";
  static const licenseCollection = "licenses";
  final db = FirebaseFirestore.instance;

  Future<List<AffiliateNetwork>> getAllAffiliates() async {
    try {
      final collections = await db.collection(affiliateCollection).get();

      final listAffiliates = collections.docs
          .map((doc) => AffiliateNetwork.fromJson(doc.id, doc.data()))
          .toList();
      return listAffiliates;
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  Future<List<RatingNetwork>> getAllRatings() async {
    try {
      final collections = await db.collection(ratingCollection).get();

      final listRatings = collections.docs
          .map((doc) => RatingNetwork.fromJson(doc.id, doc.data()))
          .toList();
      return listRatings;
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  Future<void> postNewRating(RatingNetwork rating) {
    try {
      return db.collection(ratingCollection).add(rating.toMapJson());
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  Future<void> addNewUser(UserNetwork user) {
    try {
      return db.collection(userCollection).add(user.toMapJson());
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  Future<void> updateUser(UserNetwork user) {
    try {
      final collection = db.collection(userCollection);
      final doc = collection.doc(user.id);
      return doc.update(user.toMapJson());
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  Future<UserNetwork> getUser(String userId) async {
    try {
      final usersRef = db.collection(userCollection);
      final query = usersRef.where("uid", isEqualTo: userId);
      final response = await query.get();
      final userdoc = response.docs.first;
      return UserNetwork.fromJsonMap(userdoc.id, userdoc.data());
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  Future<void> registLicense(LicenseNetwork license) {
    try {
      return db.collection(licenseCollection).add(license.toMapJson());
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  Future<void> updateLicense(LicenseNetwork license) {
    try {
      return db
          .collection(licenseCollection)
          .doc(license.id)
          .update(license.toMapJson());
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  Future<LicenseNetwork> getLicenseForThisUser(String userId) async {
    try {
      final licencesRef = db.collection(licenseCollection);
      final query = licencesRef.where("user_id", isEqualTo: userId);
      final response = await query.get();
      return LicenseNetwork.fromJsonMap(response.docs.first.id,response.docs.first.data());
    } on Exception catch (e) {
      return Future.error(e);
    }
  }
}
