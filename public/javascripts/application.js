// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
	
	// Pretty nav menu color fading
	$("#nav li a").hover(
		function() {
			if ($(this).hasClass("session")) {
				// Make the Logout link red instead
				$(this).animate({ backgroundColor: "#F05D5D"}, 400);
			} else {
				$(this).animate({ backgroundColor: "#9adb6e"}, 400);
			}
		},
		function() {
			$(this).animate({ backgroundColor: "#cccccc"}, 400);
		}
	);
	
	// Let success and error notices hang around for 3 seconds before fading out
	$("div.error, div.success")
		.fadeTo(1000, 1)
		.animate({ height: 0, opacity: 0 }, 1000)
		.hide();
		
	// Zebra stripey tables
	$('tr:even').addClass('even');
	$('tr:odd').addClass('odd');
	
	// Form Stuff
	$('.edit').click(function() {
		
	});
	
});