// jQuery Form Script
// by Mike Green
// 2/25/08
// Open Source - MIT License

jQuery.noConflict(); // put jquery into compatibility mode to not interfere with prototype's $()

jQuery(document).ready(function($){ // inside this function, $() refers to jQuery only.
	$('input[type*=text]').click(function(){
		$(this).Highlight(1000, '#FFF8AB');
		return false;
	});
});