import 'package:firebase_app_check/firebase_app_check.dart';

Future initializeFirebaseAppCheck() => FirebaseAppCheck.instance.activate(
      webProvider:
          ReCaptchaV3Provider('6LezY1ErAAAAAJaBPB9moSrrP0IbAEP35gO6pXjx'),
      androidProvider: AndroidProvider.playIntegrity,
    );
