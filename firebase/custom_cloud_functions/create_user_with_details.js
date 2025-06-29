const functions = require("firebase-functions");

const admin = require("firebase-admin");

if (!admin.apps.length) {
  admin.initializeApp();
}

exports.createUserWithDetails = functions.https.onRequest(async (req, res) => {
  if (req.method !== "POST") {
    return res.status(405).send("Method Not Allowed");
  }

  const {
    email,

    password, // ✅ Required for Firebase Auth

    userDept,

    userBio,

    userName,
    role,
  } = req.body;

  try {
    // Step 1: Create Firebase Auth user

    const userRecord = await admin.auth().createUser({
      email,

      password,

      emailVerified: true,
    });

    // Step 2: Store additional fields in Firestore

    await admin.firestore().collection("users").doc(userRecord.uid).set({
      email,

      userName,

      userDept,

      userBio,

      role,
      createdAt: admin.firestore.FieldValue.serverTimestamp(),
    });

    res.status(201).send({
      message: "User successfully created",
      uid: userRecord.uid,
      email: userRecord.email,
    });
  } catch (error) {
    res.status(400).send({
      message: "Failed to create user",
      error: error.message,
    });
  }
});
