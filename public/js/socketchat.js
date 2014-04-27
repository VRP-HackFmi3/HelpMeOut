(function(){
	console.log(location.port)
	var uri = 'ws://' + window.location.hostname + (location.port ? ':'+location.port: '') + '/channel/channel';
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
	    	if(url.indexOf("www.youtube.com") > 0)
	    	{
	    		var yurl = url.substring(5);
	    		yurl = yurl.replace("watch?v=","embed/")
	    		var y = '<iframe width="100%" src="'+yurl+'" frameborder="0" allowfullscreen></iframe>'
	    		$("#linkAggregator").append(y);
	    		var span = document.createElement("span");
	    		var $span = $(span);
	    		$span.addClass("stars");
	    		$span.css("margin-top","5px");
	    		$span.css("margin-bottom","5px")
	    		$span.attr("data-default","3")

	    		$("#linkAggregator").append($span)
	    		$span.click(function(e){
	    			$span.addClass("s-5");
	    		})
	    	}
	    	else
	    	{
		    	var a = document.createElement("a");
	    		var p = document.createElement("p");
	    		$(a).attr("href",url);
		    	$(a).text(a);
		    	$(p).append(a);
		    	$("#linkAggregator").append(p);
	    	}
	        return url;
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