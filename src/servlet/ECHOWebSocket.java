package servlet;

import org.eclipse.jetty.websocket.api.Session;
import org.eclipse.jetty.websocket.api.WebSocketAdapter;

public class ECHOWebSocket extends WebSocketAdapter {
	@Override
	public void onWebSocketText(String message) {
		System.out.println(getSession().getRemoteAddress().toString());
		System.out.println(message);
		super.onWebSocketText(message);
	}
	@Override
	public void onWebSocketConnect(Session sess) {
		System.out.println(sess.getRemoteAddress().toString()+" connectde."); 
		super.onWebSocketConnect(sess);
	}
}
