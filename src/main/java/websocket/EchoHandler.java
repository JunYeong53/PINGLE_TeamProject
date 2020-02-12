package websocket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import logic.Message;
import logic.ShopService;
import logic.User;

@Component
public class EchoHandler extends TextWebSocketHandler  {

	// 1:1 ä���� ���� map���
	private Map<String, WebSocketSession> clients = new HashMap<String, WebSocketSession>();
	@Autowired
	private ShopService service;
	// private Set<WebSocketSession> clients = new HashSet<WebSocketSession>();
	
	// Ŭ���̾�Ʈ �������Ŀ� ����Ǵ� �޼���
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		super.afterConnectionEstablished(session);
		System.out.println("Ŭ���̾�Ʈ ���� : " + session.getId());
		User user = getUser(session);
		System.out.println(user.getId());
		clients.put(session.getId(), session);

	}
	
	private User getUser(WebSocketSession session) {
		return (User)session.getAttributes().get("loginUser");
	}

	// Ŭ���̾�Ʈ�� �����ϼ����� �޽����� �������� �� ����Ǵ� �޼���
	@Override 
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception{
		super.handleMessage(session, message);
//		String loadMessage = (String)message.getPayload();
//		clients.add(session); 
//		for(WebSocketSession s : clients) s.sendMessage(new TextMessage(loadMessage));
		User user = getUser(session);
//		Message msg = new Message();
//		int cn = (int)session.getAttributes().get("chatnum");
//		int maxnum = service.msgmaxnum() + 1;
//		msg.setMessagenum(1);
//		msg.setChatnum(cn);
//		msg.setMessagesender(user.getId());
//		msg.setMessagecontent((String)message.getPayload());
//		System.out.println(msg);
//		service.insertmsg(msg);
		System.out.println("send message");
		Iterator<String> sessionIds = clients.keySet().iterator();
		String sessionId = "";
		while(sessionIds.hasNext()) {
			sessionId = sessionIds.next();
			//clients.get(sessionId).sendMessage(new TextMessage(user.getNickname() + ":" + message.getPayload()));
			clients.get(sessionId).sendMessage(new TextMessage(user.getNickname() + ":" + message.getPayload()));
		}
	}
	
	@Override 
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception{
		super.handleTransportError(session, exception);
	}
	
	// Ŭ���̾�Ʈ�� ������ ������ �� ����Ǵ� �޼���
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		super.afterConnectionClosed(session, status);
//		clients.remove(session);
		clients.remove(session.getId());
	}



}
