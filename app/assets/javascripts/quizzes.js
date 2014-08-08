// when the page is ready
$(function() {
  	// initially, only show the first question
  	//hide all first
  	var index = 0;
  	$('.question').hide();
  	$('.submitbutton').hide();
  	$($('.question')[index]).show();



	// upon enter, hide whichever one I'm on

	$('input[type=text]').keyup(function(e){
	    if(e.keyCode == 13)
	    {
	        // if (index == $('.question').size() -1){
	        // 	$('#problem_form').submit();
	        // }
	        // else {
	        
	        	$($('.question')[index]).hide();
	        	index++;
	        	$($('.question')[index]).show();
	        	$($('.question')[index]).find('input').focus();
	    	// 	}
	    }
	});

	$('#problem_form').submit(function(e){
		console.log(index);
		if (index != $('.question').size() - 1){
			e.preventDefault();
		}
	});

	// show the next one

	// unless we're at the last one

	// in which case, submit the form
});