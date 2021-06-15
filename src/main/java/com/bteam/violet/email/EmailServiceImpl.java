package com.bteam.violet.email;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailServiceImpl implements EmailService{
	
	@Inject
	JavaMailSender mailSender; // root-context.xml에 설정한 bean, 의존성 주입!

	@Override
	public void sendMail(EmailDTO dto) {
		
		try {
			/*
             * createMimeMessage() : MimeMessage 객체 생성(이걸로 메시지를 구성한 뒤 메일 발송)
             * addRecipient() : 메시지의 발신자를 설정 InternetAddress() : 이메일 주소 getReceiveMail() :
             * 수신자 이메일 주소
             */
			
			MimeMessage msg = mailSender.createMimeMessage();
			
			// 받는사람 설정 (받는사람의 이메일 주소 객체를 생성해서 수신자 이메일 주소 담기)
			msg.addRecipient(RecipientType.TO, new InternetAddress(dto.getReceiveMail()));
			
			// 보내는 사람(이메일 주소, 이름 설정)
			msg.addFrom(new InternetAddress[] { new InternetAddress(dto.getSenderMail(), dto.getSenderName()) });
			
			// 이메일 제목 작성
			msg.setSubject(dto.getSubject(), "utf-8");
			
			// 이메일 내용 작성
			msg.setText(dto.getMessage(), "utf-8");
			
			mailSender.send(msg);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	

}
