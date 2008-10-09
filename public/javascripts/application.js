// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
	
	// Pretty nav menu color fading
	$("#nav li a").hover(
		function() {
			$(this).animate({ backgroundColor: "#9adb6e"}, 500);
		},
		function() {
			$(this).animate({ backgroundColor: "#e4d487"}, 500);
		}
	);
	
	// Let success and error notices hang around for 3 seconds before fading out
	$("span.error, span.success").fadeTo(3000, 1).fadeOut(1000);
	
});