# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	$(".photo-infos-popover").popover({placement:'top'})
	
	$(".like-button").click ->
		$(this).hide();
		$(this).parent().children('.ajax-loader').show();