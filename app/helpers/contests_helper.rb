#!/bin/env ruby
# encoding: utf-8
module ContestsHelper
  
  def status_label(status)
  	if status == "waiting"
  		raw '<span class="label label-default label-sm">En attente</span>'
  	elsif status == "open"
  		raw '<span class="label label-danger label-sm">Participations ouvertes</span>'
  	elsif status == "finished" 
  		raw '<span class="label label-default label-sm">Participations terminées</span>'
  	elsif status == "vote_open" 
  		raw '<span class="label label-danger label-sm">Votes en cours</span>'
  	elsif status == "vote_closed" 
  		raw '<span class="label label-success label-sm">Concours terminé</span>'
  	end
  end
    
  def contest_status_sentence(contest)
  	if contest.status == "waiting"
  		"Le concours commencera dans #{distance_of_time_in_words_to_now contest.date_start} et durera #{distance_of_time_in_words(contest.date_start,contest.date_end)}"
  	elsif contest.status == "open"
  		"Les participations termineront dans #{distance_of_time_in_words_to_now contest.date_end}"
  	elsif contest.status == "finished" 
  		"Les participations sont terminées. Les votes commenceront dans #{distance_of_time_in_words_to_now contest.vote_start}"
  	elsif contest.status == "vote_open" 
  		"Les votes termineront dans #{distance_of_time_in_words_to_now contest.vote_end}"
  	elsif contest.status == "vote_closed" 
  		"Les votes sont terminés depuis #{distance_of_time_in_words_to_now contest.vote_end}"
  	end
  end
end
