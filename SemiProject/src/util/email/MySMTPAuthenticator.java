package util.email;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MySMTPAuthenticator extends Authenticator{
	
	@Override
	public PasswordAuthentication getPasswordAuthentication() {
	      
	   // Gmail 의 경우 @gmail.com 을 제외한 아이디만 입력한다.
		return new PasswordAuthentication("thstjddn0223","s71006248@"); 
    }
}