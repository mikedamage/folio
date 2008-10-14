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
	
	// Let success and error notices hang around for 2 seconds before fading out
	$("div.error, div.success")
		.fadeTo(2000, 1)
		.hide(2000);
		
	// Zebra stripey tables
	$('tr:even').addClass('even');
	$('tr:odd').addClass('odd');
	
	// Form Stuff
	$('.edit').hide();
	$('#edit_link').click(function() {
		$('.show').hide("fast");
		$('.edit').show("fast");
	});
	$('#show_link').click(function() {
		$('.show').show('fast');
		$('.edit').hide('fast');
	});
	
	// Add custom fields to category
	var custom_field = '<p><label>Custom Field</label><br/><input type="text" name="category[custom_fields][]" class="custom_field" /> <a href="#" onclick="$(this).parent().remove(); return false;" class="remove"><img src="/images/icons/subtract.gif" width="16" height="16" alt="remove field"/></a></p>';
	
	$('#add_custom_field').click(function() {
		$(custom_field).appendTo(".custom_fields");
		return false;
	})
	.hover(
		function() { $("#add_custom_field img").css("background-color", "#2baa05"); },
		function() { $("#add_custom_field img").css("background-color", "#9adb6e"); }
	);
	
	$('.remove').hover(
		function() { $(".remove img").css("background-color", "#E22929"); },
		function() { $(".remove img").css("background-color", "#F05D5D") }
	);
	
});