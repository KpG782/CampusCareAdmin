const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.deleteUserByEmail = functions.https.onRequest(async (req, res) => {
  // Parse request body to get the email

  const { email } = req.body;

  try {
    // Find user by email

    const userRecords = await admin.auth().getUserByEmail(email);

    // Delete the user

    await admin.auth().deleteUser(userRecords.uid);

    // Respond with success message

    res
      .status(200)
      .send(`User with email ${email} has been successfully deleted`);
  } catch (error) {
    // Respond with error message

    res
      .status(400)
      .send(`Failed to delete user with email ${email}: ${error.message}`);
  }
});
