(function(){

	var uri = 'ws://' + window.location.hostname + ':9292/channel/channel';
	websocket = new WebSocket(uri);

	websocket.onmessage = function(e){
		var msg = document.createElement("p");
		$(msg).text(e.data)
		$("#messages").append(msg);
	}

	$("#sender").keypress(function(e){
		if(e.keyCode == 13){
			var text = $("#sender").val();
			if(text && text != ""){
				websocket.send(text);
				$("#sender").val("");
			}
			return false;
		}
	})

	websocket.onclose = function(){
		$("#sender").keypress(function(e){return false});
		var msg = document.createElement("p");
		$(msg).text("The host has left.")
		$("#messages").append(msg);
	}
})()