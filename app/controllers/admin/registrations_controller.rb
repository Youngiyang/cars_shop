class Admin::RegistrationsController < Devise::RegistrationsController
  def new
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404
  end

  def create
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404
  end
end
