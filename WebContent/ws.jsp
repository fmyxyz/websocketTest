<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<title>发送内容</title>
<style type="text/css">
 
html, body, div {
	height: 100%;
}

#msg {
	width: 100%;
	height: 400px;
	border: solid 1px;
	overflow:scroll;
}

#s {
	height: 100px;
}

div {
	width: 100%;
	border: solid 1px;
}

textarea {
	width: 100%;
	height: 100px;
}
</style>
</head>
<body>
	<form>
		<div>
			<div id="msg"></div>
			<div id="s">
				<textarea rows="3" cols="5" id="send"></textarea>
			</div>
			<button id="btnSend" onclick="sendMsg();">发送</button>
		</div>
	</form>
	<script type="text/javascript">
		//创建一个Socket实例
		var socket = new WebSocket('ws://127.0.0.1:800/ws');

		// 打开Socket 
		socket.onopen = function(event) {

			// 发送一个初始化消息
			socket.send('I am the client and I\'m listening!');

			// 监听消息
			socket.onmessage = function(event) {
				console.log('Client received a message', event);
				document.getElementById('msg').innerHTML = '<ul>' + event
						+ '</ul>';
			};

			// 监听Socket的关闭
			socket.onclose = function(event) {
				console.log('Client notified socket has closed', event);
			};

			// 关闭Socket.... 
			//socket.close() 
		};
		function sendMsg() {
			var msg = document.getElementById('send').value;
			socket.send(msg);
		}
	</script>
</body>
</html>