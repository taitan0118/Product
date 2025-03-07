package poly.com.mail;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import poly.com.model.MailInfo;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class MailerServiceImpl implements MailerService{
	

	@Autowired
	JavaMailSender sender;
	
	List<MailInfo> list = new ArrayList<>();

	@Override
	public void send(MailInfo mail) throws MessagingException {
		// TODO Auto-generated method stub
		MimeMessage message = sender.createMimeMessage();
		
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		helper.setFrom(mail.getFrom());
		helper.setTo(mail.getTo());
		helper.setSubject(mail.getSubject());
		helper.setText(mail.getBody(), true);
		helper.setReplyTo(mail.getFrom());
		
		if(mail.getCc() != null && mail.getCc().length > 0) {
			helper.setCc(mail.getCc());
			System.out.println("ok1");
		}
		
		if(mail.getBcc() != null && mail.getBcc().length > 0) {
			helper.setBcc(mail.getBcc());
			System.out.println("ok2");
		}
		
		if(mail.getAttachments() != null && mail.getAttachments().length > 0) {
			System.out.println("ok3");
			for(String path:mail.getAttachments()) {
				File file = new File(path);
				helper.addAttachment(file.getName(), file);
				System.out.println("ok4");
			}
		}
		
		sender.send(message);
		System.out.println("ok");
	}

	@Override
	public void send(String to, String subject, String body) throws MessagingException {
		// TODO Auto-generated method stub
		this.send(new MailInfo(to, subject, body));
	}

	@Override
	public void queue(MailInfo mail) {
		// TODO Auto-generated method stub
		list.add(mail);
		System.out.println("vc2");
	}

	@Override
	public void queue(String to, String subject, String body) {
		// TODO Auto-generated method stub
		queue(new MailInfo(to, subject, body));
		System.out.println("vc");
	}
	
	@Scheduled(fixedDelay = 1000)
	public void run() {
		while(!list.isEmpty()) {
			MailInfo mail = list.remove(0);
			try {
				this.send(mail);
				System.out.println("vc1");
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}

}
