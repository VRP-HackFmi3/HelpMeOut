$(document).ready(function(){
	var timeContainers = $(".time_container")

	timeContainers.each(function(idx,container){
		$container = $(container);
		var bars = $container.children(".time_bar");
		bars.hours = $container.children(".hours");
		bars.minutes = $container.children(".minutes");
		bars.seconds = $container.children(".seconds");

		var sourceInterval;
		var dispose = function(){
			bars.parent().parent().remove();
			stopInterval(sourceInterval);
		}

		bars.each(function(iidx,bar){
			$bar = $(bar);

			$bar.children(".time_indicator").text($bar.data("current"));

			var fill = $bar.data("current") / $bar.data("maxcount");
			
			fill = fill > 1 ? 1 : fill;
			fill *= 10;
			fill = Math.floor(fill);
			
			$bar.attr("data-fill",fill);
		})
		setTimeout(function(){
			sourceInterval = setInterval(function(){
				decrement = function(bar){
					var nextVal = bar.attr("data-current") - 1;
					bar.attr("data-current" , nextVal);
					if(bar.attr("data-current") <= 0){
						if(bar.prev().length != 0){
							bar.attr("data-current",bar.data("maxcount"))
							decrement(bar.prev());
						}
						else dispose();
					}

					var fill = bar.attr("data-current") / bar.attr("data-maxcount");
					fill = fill > 1 ? 1 : fill;
					fill *= 10;
					fill = Math.floor(fill);

					bar.attr("data-fill",fill);
					
					bar.children(".time_indicator").text(bar.attr("data-current"));			
				}

				decrement(bars.seconds);
			},1000);
		},Math.random()*1000)
	})
})