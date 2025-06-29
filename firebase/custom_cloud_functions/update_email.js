const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.updateEmail = functions
  .region("southamerica-east1")
  .https.onCall(async (data, context) => {
    // Authentication / user information is automatically added to the request.
    if (!context.auth || !context.auth.uid) {
      throw new functions.https.HttpsError(
        "unauthenticated",
        "You must be logged in to create a user.",
      );
    }

    const { emailNew, uid } = data;

    try {
      //update e-mail of user

      await admin.auth().updateUser(uid, { email: emailNew });

      // Update the email of the specified user in Firestore
      const userDocRef = admin.firestore().collection("user").doc(uid);
      await userDocRef.update({
        email: emailNew,
      });

      return {
        status: "SUCCESS",
        message: "Email do usuário atualizado com sucesso!",
      };
    } catch (error) {
      console.error("Error creating user:", error);
      throw new functions.https.HttpsError(
        "internal",
        "Internal error occurred while creating user.",
      );
    }
  });
