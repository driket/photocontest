# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

refresh_remaining_votes = (photo_id) ->
	photo_url = "/photos/#{photo_id}/remaining_votes"
	$.getJSON photo_url, ( data ) ->
		console.log "get json", data
		$("#remaining_votes").html(data.remaining_votes)
	.done ->	
		console.log "data done"
	.fail ->
		alert("Impossible de mettre à jour le nombre de voix restantes.")
		
$ ->
	$(".photo-infos-popover").popover({placement:'top'})
	
	$(".vote-button").click (e) ->
		e.preventDefault();
		_this = this
		$(_this).hide();
		$(_this).parent().children('.ajax-loader').show();
		photo_id = $(_this).parent().attr('data-photo-id')
		
		if $(_this).hasClass('like-button')
			photo_url = "/photos/#{photo_id}/vote"
			$.getJSON photo_url, ( data ) ->
				console.log "data",data
				#alert data.message
			.done ->
				$(_this).parent().children('.unlike-button').show();
				$(_this).parent().children('.ajax-loader').hide();
				refresh_remaining_votes(photo_id)
				
			.fail ->
				alert "Impossible de voter. Veuillez vérifier qu'il vous reste des voix."
				$(_this).show();
				$(_this).parent().children('.ajax-loader').hide();
			
		if $(_this).hasClass('unlike-button')
			photo_url = "/photos/#{photo_id}/unvote"
			$.getJSON photo_url, ( data ) ->
				console.log "data",data
				#alert data.message
			.done ->
				$(_this).parent().children('.like-button').show();
				$(_this).parent().children('.ajax-loader').hide();
				refresh_remaining_votes(photo_id)
				
			.fail ->
				alert "Impossible de voter. Veuillez vérifier qu'il vous reste des voix."
				$(_this).show();
				$(_this).parent().children('.ajax-loader').hide();		
