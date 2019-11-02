class WelcomeController < ApplicationController
  before_action :authenticated?
  def index
  end
end
