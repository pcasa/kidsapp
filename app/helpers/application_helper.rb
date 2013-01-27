module ApplicationHelper
  def resource_name
      :user
    end

    def resource
      @resource ||= User.new
    end

    def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
    end
    
    def humanize_age(child)
      if child.birth_month && child.birth_year
      d1 = Date.new(Date.today.year, Date.today.month, 1)
      d2 = Date.new(child.birth_year, child.birth_month, 1)
      age = d1 - d2
      age_to_words(age)
      end
    end
    
  
  def age_to_words(age_in_days)
    years = (age_in_days.to_i / 365).to_i
    age_in_days = age_in_days % 365
    months = (age_in_days.to_i / 30).to_i
    age_in_days = age_in_days % 30
    days = (age_in_days.to_i / 1).to_i

    if years < 1
      if months < 1
        "#{days} days old"
      else
        m = pluralize(months, "month")
        "#{m} old"
      end
    else
      y = pluralize(years, "year")
      m = pluralize(months, "month")
      "#{y}, #{m} old"
    end
  end
  
end
