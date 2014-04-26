function loadAnswer(callback){
	var apiUrl = "http://"+window.location.hostname+":9292/qaapi/";
	$.ajax({
		url:apiUrl,
		method:"GET",
		success:function(e){
			callback(e);
		}
	});
}

function answerQuestion(question,ecallback){
	var apiUrl = "http://"+window.location.hostname+":9292/qaapi?ynQuestion="+question.id+"&answer="+question.answer
	$.ajax({
		url:apiUrl,
		method:"POST",
		success:ecallback
	})
}

			loadAnswer(function(e){
				var title = document.createElement("h4");
				var p = document.createElement("p");
				$(title).text(e.question.title);
				$(p).text(e.question.text)
				var yes = document.createElement("button");
				var no = document.createElement("button");
				var responder = function(answer){
					answerQuestion({
						id:e.question.id,
						answer:answer,
					},function(e){
						$(p).remove();
						$(title).text("Thank you :)");
						$(yes).remove();
						$(no).remove();
						console.log(e);
					});
				}
				$(yes).click(function(){
					responder("Yes");
				}).text("Yes");
				$(no).click(function(){
					responder("No");
				}).text("No");
				$("#questionPlaceholder").append(title);
				$("#questionPlaceholder").append(p);
				$("#questionPlaceholder").append(yes);
				$("#questionPlaceholder").append(no);
			})