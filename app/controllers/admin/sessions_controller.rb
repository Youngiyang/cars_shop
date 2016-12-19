class Admin::SessionsController < Devise::SessionsController
  layout 'singlepage'
  def new
    super
  end

  def destroy
    super
  end
end
