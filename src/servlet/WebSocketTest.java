package servlet;

import javax.servlet.annotation.WebServlet;

import org.eclipse.jetty.websocket.servlet.WebSocketServlet;
import org.eclipse.jetty.websocket.servlet.WebSocketServletFactory;

@WebServlet("/ws")
public class WebSocketTest extends WebSocketServlet {
	private static final long serialVersionUID = -7887434075071533102L;

	@Override
	public void configure(WebSocketServletFactory factory) {
		factory.register(ECHOWebSocket.class);
	}
}
