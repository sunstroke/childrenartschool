module Admin::PeopleHelper
  def age(birthday)
    @age=Time.now.utc.to_date.year - birthday.to_date.year - (birthday.to_date.change(:year => Time.now.utc.to_date.year) > Time.now.utc.to_date ? 1 : 0)
    @age.to_s
  end
end
