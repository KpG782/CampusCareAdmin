const admin = require("firebase-admin/app");
admin.initializeApp();

const createUserWithDetails = require("./create_user_with_details.js");
exports.createUserWithDetails = createUserWithDetails.createUserWithDetails;
const deleteUserByEmail = require("./delete_user_by_email.js");
exports.deleteUserByEmail = deleteUserByEmail.deleteUserByEmail;
const updateEmail = require("./update_email.js");
exports.updateEmail = updateEmail.updateEmail;
