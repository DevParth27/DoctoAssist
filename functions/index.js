const functions = require("firebase-functions");
const admin = require("firebase-admin");
const sgMail = require('@sendgrid/mail');

// Initialize Firebase Admin SDK
admin.initializeApp();

// Set your SendGrid API key (store it securely)
sgMail.setApiKey('your-sendgrid-api-key');

exports.sendPrescription = functions.https.onCall(async (data, context) => {
  const email = data.email;
  const prescriptionDetails = data.prescriptionDetails;

  try {
    // Send email via SendGrid
    const msg = {
      to: email,
      from: 'your-email@example.com',
      subject: 'Your Prescription',
      text: prescriptionDetails,
    };

    await sgMail.send(msg);

    return { message: 'Prescription sent successfully!' };
  } catch (error) {
    console.error('Error sending prescription:', error);
    throw new functions.https.HttpsError('unknown', 'Failed to send prescription');
  }
});
