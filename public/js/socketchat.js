(function(){

	var uri = 'ws://' + window.location.hostname + (location.port ? ':'+location.port: '') + "/channel/channel';
	websocket = new WebSocket(uri);

	websocket.onmessage = function(e){
		var msg = document.createElement("p");
		$(msg).text(urlify(e.data))
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

	function urlify(text) {
	    var urlRegex = /(https?:\/\/[^\s]+)/g;
	    return text.replace(urlRegex, function(url) {
	    	if("#linkAggregator").append(url);
	        return '<a href="' + url + '">' + url + '</a>';
	    })
	    // or alternatively
	    // return text.replace(urlRegex, '<a href="$1">$1</a>')
	}

	websocket.onclose = function(){
		$("#sender").keypress(function(e){return false});
		var msg = document.createElement("p");
		$(msg).text("The host has left.");
		$("#messages").append(msg);
	}

	$()
})()