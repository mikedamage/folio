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
	
});