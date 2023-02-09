package services;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import javax.mail.Authenticator;

public class EmailSenderService {

	private static Properties properties = new Properties();
    private static String username = "patri.basme.99@gmail.com";
	private static String password = "pjxfuvkvqzckgwcc"; 
    private static Session session;
    
    public EmailSenderService() {
    	
    	try {
    			InitialContext ctx = new InitialContext();
    			Context env = (Context) ctx.lookup("java:comp/env");
    			// nombre del recurso en el context.xml
    			properties = (Properties) env.lookup("smtp/email");
    			
    			
    		} catch (NamingException e) {
    			e.printStackTrace();
    		}
 
    }
 
    public static void sendEmail(String recipient, String subject, String text) {
 
        try{
        	session = Session.getInstance(properties);
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
            message.setSubject(subject);
            message.setText(text);
            
            Transport transport = session.getTransport("smtp");

            transport.connect(username, password);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }catch (MessagingException e){
            e.printStackTrace();
        }

    }
	
}
