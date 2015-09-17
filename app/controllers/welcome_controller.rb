class WelcomeController < ApplicationController
  def index
    @categories = Category.all.limit(50)
  end
end
