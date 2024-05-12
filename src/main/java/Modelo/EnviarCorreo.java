package Modelo;


import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EnviarCorreo {
   
    private static String emailForm = "keivercuenta3@gmail.com";
    private static String PassFrom = "rzli miic wclo jhtz";
    private String emailTo;
    private String subject;
   
    
    private Properties MProperties;
    private Session mSession;
    private MimeMessage mCorreo;
    
    public void createEmail(String CorreoTo, String ContextoCorreo) throws MessagingException {
        emailTo = CorreoTo;
        subject = "Recuperar tu contraseña";
         MProperties = new Properties();
        
        MProperties.put("mail.smtp.host", "smtp.gmail.com");
        MProperties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        MProperties.setProperty("mail.smtp.starttls.enable", "true");
        MProperties.setProperty("mail.smtp.port", "587");
        MProperties.setProperty("mail.smtp.user", emailForm);
        MProperties.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
        MProperties.setProperty("mail.smtp.auth", "true");
        mSession = Session.getDefaultInstance(MProperties);
        try {
            mCorreo = new MimeMessage(mSession);
            mCorreo.setFrom(new InternetAddress(emailForm));
            mCorreo.setRecipient(Message.RecipientType.TO, new InternetAddress(emailTo));
            mCorreo.setSubject(subject);
            mCorreo.setText(ContextoCorreo);
        } catch (AddressException ex) {
            Logger.getLogger(EnviarCorreo.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public void sendEmail() {
        try {
            Transport  STransport = mSession.getTransport("smtp");
            STransport.connect(emailForm, PassFrom);
            STransport.sendMessage(mCorreo, mCorreo.getRecipients(Message.RecipientType.TO) );
            STransport.close();
        } catch (NoSuchProviderException ex) {
            Logger.getLogger(EnviarCorreo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            Logger.getLogger(EnviarCorreo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
