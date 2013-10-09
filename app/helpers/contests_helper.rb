module ContestsHelper
  
  def status_label(contest)
  	if contest.status == "waiting"
  		raw '<span class="label label-warning label-sm">En attente</span>'
  	elsif contest.status == "open"
  		raw '<span class="label label-danger label-sm">En cours</span>'
  	elsif contest.status == "finished" 
  		raw '<span class="label label-default label-sm">Fermé</span>'
  	elsif contest.status == "vote_open" 
  		raw '<span class="label label-danger label-sm">Votes en cours</span>'
  	elsif contest.status == "vote_closed" 
  		raw '<span class="label label-default label-sm">Votes fermés</span>'
  	end
  end
    
  def status_sentence(contest)
  	if contest.status == "waiting"
  		"Le concours commencera dans #{distance_of_time_in_words_to_now contest.date_start} et durera #{distance_of_time_in_words(contest.date_start,contest.date_end)}"
  	elsif contest.status == "open"
  		"Le concours terminera dans #{distance_of_time_in_words_to_now contest.date_end}"
  	elsif contest.status == "finished" 
  		"Le concours est terminé. Les votes commenceront dans #{distance_of_time_in_words_to_now contest.vote_start}"
  	elsif contest.status == "vote_open" 
  		"Les votes termineront dans #{distance_of_time_in_words_to_now contest.vote_end}"
  	elsif contest.status == "vote_closed" 
  		"Les votes sont terminés depuis #{distance_of_time_in_words_to_now contest.vote_end}"
  	end
  end
end
