package utils;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class EmailSending {

    public static void sendRegistrationEmail(String email, String name) {
        Properties props = new Properties();

        props.put("mail.transport.protocol", "smtp");

        props.put("mail.smtp.host", "smtp.gmail.com");

        props.put("mail.smtp.port", "587");

        props.put("mail.smtp.auth", "true");

        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new MailAuthenticator());

        try {
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom("sm4112605@gmail.com");
            msg.setRecipients(Message.RecipientType.TO, email);
            msg.setSubject("Welcome to KDM Scorer - Registration Successful!\r\n");
            msg.setText("Hello" + name + ",\r\n" + //
                    "\r\n" + //
                    "Thank you for registering with KDM Scorer!\r\n" + //
                    "\r\n" + //
                    "Your account has been successfully created. You can now start managing cricket scores, tracking match updates, and enjoying all the features that KDM Scorer offers.\r\n"
                    + //
                    "\r\n" + //
                    "If you have any questions or need support, feel free to reach out to us anytime.\r\n" + //
                    "\r\n" + //
                    "Happy Scoring! 🏏\r\n" + //
                    "\r\n" + //
                    "Best regards,  \r\n" + //
                    "The KDM Scorer Team  \r\n" + //
                    "");

            Transport.send(msg);
        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }

    public static void sendForgetPasswordEmail(String email, int rNo) {
        Properties props = new Properties();

        props.put("mail.transport.protocol", "smtp");

        props.put("mail.smtp.host", "smtp.gmail.com");

        props.put("mail.smtp.port", "587");

        props.put("mail.smtp.auth", "true");

        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new MailAuthenticator());

        try {
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom("sm4112605@gmail.com");
            msg.setRecipients(Message.RecipientType.TO, email);
            msg.setSubject("Password Reset Request – KDM Scorer\r\n");
            msg.setText("Dear [User],\r\n" + //
                    "\r\n" + //
                    "We received a request to reset your password for your KDM Scorer account.\r\n" + //
                    "\r\n" + //
                    "Your 4-digit verification code is:  "+ rNo + "\r\n" + //
                    "\r\n" + //
                    "Please enter this code on the password reset page to proceed.\r\n" + //
                    "\r\n" + //
                    "If you did not request a password reset, please ignore this email or contact support.\r\n" + //
                    "\r\n" + //
                    "Regards,  \r\n" + //
                    "Team KDM Scorer\r\n" + //
                    "");

            Transport.send(msg);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

}

class MailAuthenticator extends Authenticator {
    public PasswordAuthentication getPasswordAuthentication() {
        return new javax.mail.PasswordAuthentication("sm4112605@gmail.com", "smnvxusxxxnpiwmq");
    }
}
