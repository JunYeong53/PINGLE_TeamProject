package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.BoardException;
import exception.ChatException;
import logic.Chatroom;
import logic.Interest;
import logic.Message;
import logic.ShopService;
import logic.User;

@Controller
@RequestMapping("chat")
public class ChatController {
	
	@Autowired
	private ShopService service;
	
	@RequestMapping("*")
	public String chat(Model model, Integer chatnum, HttpSession session) {
		Chatroom cr = service.selectchat(chatnum); // �ش� ä�ù� ��ȣ ������
		User user = (User)session.getAttribute("loginUser");
		if(!user.getId().equals(cr.getId()) && !user.getId().equals(cr.getGoodid())) {
			throw new ChatException("�ش� ä���� �����ڰ� �ƴմϴ�.","../main/main.shop");
		}
		List<Message> chatlist = service.chatlist(chatnum); // �ش� ä�ù� ��ȣ�� �̿��� ä�ó��� ��ȸ
		List<Interest> intlist = new ArrayList<>(); // ���� ���ɻ� ����Ʈ�� ������������ ����Ʈ ����
		
		for(int i = 0; i < chatlist.size(); i++) {
			User sender = service.userselectone(chatlist.get(i).getMessagesender()); // �ش� �޼������� ������ ��ü ��ȸ
			chatlist.get(i).setUser(sender); // ä�ó��� ��ü�� ������ ���� ����
		}
		
		List<Chatroom> chatroomlist = chatroom(session); // ����
		model.addAttribute("proflieurl", user.getProfileurl1());// ����
	    model.addAttribute("chatlist", chatroomlist); // ����
	    
		User partner = new User(); // ���� ������ ������ �� ��ü ����
		if(cr.getId().equals(user.getId())) partner = service.userselectone(cr.getGoodid()); // ���� �ƴ� �ٸ� id�� ����id�̹Ƿ� 
		if(cr.getGoodid().equals(user.getId())) partner = service.userselectone(cr.getId()); // ���� id�� ���� ���� ��ȸ
		
		// ������ ���ɻ� �̸��� ���ڿ��迭�� ����. ���� ������� ���ɻ��̸� or null�� ����
		String[] intname = {partner.getInterestname1(), partner.getInterestname2(), partner.getInterestname3(), partner.getInterestname4(), partner.getInterestname5(), partner.getInterestname6()};
		
		// ���ɻ� �ִ� ������ŭ �ݺ��� ������
		for(int i = 0; i < 6; i++) {
			if(intname[i] != null) { // i+1��° ���ɻ簡 null�̾ƴϸ�
				Interest in = service.selectinterest(intname[i]); // �ش� ���ɻ� �̸����� ���ɻ� ������ȸ�ؼ� ��ü�� ������ ����
				intlist.add(in); // ���ɻ� ��ü�� �̷���� list�� �߰�
			}
			else break; // null�̸� �ݺ��� ����
		}
		
		model.addAttribute("partner", partner); // ���� ���� ��� ����
		model.addAttribute("postchat", chatlist); // ä�ó��� ��� ����
		model.addAttribute("userid", user.getId());
		model.addAttribute("interestlist", intlist); // ���ɻ� ���� ��� ����
		
		return null;
	}
	
	private List<Chatroom> chatroom(HttpSession session){
		User u = (User)session.getAttribute("loginUser");
		List<Chatroom> chatlist = service.roomlist(u.getId());
		for(int i = 0; i < chatlist.size(); i++) {
			String pi = "";
			if(chatlist.get(i).getId().equals(u.getId())) pi = chatlist.get(i).getGoodid();
			if(chatlist.get(i).getGoodid().equals(u.getId())) pi = chatlist.get(i).getId();
			User p = service.userselectone(pi);
			chatlist.get(i).setUser(p);
		}
		return chatlist;
	}
}
