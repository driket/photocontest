# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->

	$lines = 4
	$linesUsed = $('#linesUsed')
	$('.max-rows-limit').keydown (e) ->
		$newLines = $(this).val().split("\n").length
		$linesUsed.text($newLines)
		if(e.keyCode == 13 && $newLines >= $lines)
			$linesUsed.css('color', 'red')
			return false
		else
			$linesUsed.css('color', '')