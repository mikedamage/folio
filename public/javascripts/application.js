// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
	
	// Pretty nav menu color fading
	$("#nav li a").hover(
		function() {
			$(this).animate({ backgroundColor: "#9adb6e"}, 400);
		},
		function() {
			$(this).animate({ backgroundColor: "#cccccc"}, 400);
		}
	);
	
	// Let success and error notices hang around for 3 seconds before fading out
	$("div.error, div.success")
		.fadeTo(3000, 1)
		.animate({ height: 0, opacity: 0 }, 1000);
	
});