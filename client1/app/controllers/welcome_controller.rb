class WelcomeController < ApplicationController
  before_action :authenticated?
  def index

  end

  def logout
	session["user"] = nil
	return redirect_to '/'
  end
end
