module UsersHelper
  def get_city_name(p)
    ChinaCity.get(p)
  end
end
