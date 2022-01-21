import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'user_authentication_repository.dart';

final authenticationProvider = Provider<FirebaseAuth>(
  (reference) => FirebaseAuth.instance,
);

final firestoreProvider = Provider<FirebaseFirestore>(
  (reference) => FirebaseFirestore.instance,
);

final userAuthenticationProvider = Provider<UserAuthenticationRepository>(
  (reference) => UserAuthenticationRepository(reference.read),
);
