module ApplicationHelper
  def convert_seconds_to_time(to_time, from_time)
    #distance_of_time_in_words(time1, time2, :only => [:days, :hours, :minutes])
    #time_ago_in_words(seconds.seconds.from_now)
    from_time = from_time.to_time if from_time.respond_to?(:to_time)
    to_time = to_time.to_time if to_time.respond_to?(:to_time)
    dist = to_time - from_time
    minutes = (dist.abs / 60).round
    hours = minutes / 60
    minutes = minutes - (hours * 60)
  
    words = dist <= 0 ? '' : '-'
  
    words << "#{hours} #{hours > 1 ? 'Stunden' : 'Stunde' } und " if hours > 0
    words << "#{minutes} #{minutes == 1 ? 'Minute' : 'Minuten' }"
  end

  def avatar_url(mail, size)
    gravatar_id = Digest::MD5.hexdigest(mail.downcase) if mail
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end
  
  def count_visits(survey)
    count = survey.visits.count.to_i
    
    if count == 0
      link_to "Informationen zu einem Besuch durch #{survey.project.name} aufnehmen", new_survey_visit_path(survey) if logged_in?
    else
      "#{count} #{count > 1 ? 'Besuche' : 'Besuch'}"
    end
  end

  def available_name(user)
    if user_person(user)
      user_person(user).fullname
    else
      user.username
    end
  end

  def user_person(user)
    Person.find_by_user_id(user)
  end

  def cite_entry(cit)
    cit.reference.people.map(&:fullname).join(", ")+ ", " + cit.reference.year.strftime("%Y") + ", " + link_to("#{cit.reference.title}", cit.reference) + ", " + cit.target
  end

end
