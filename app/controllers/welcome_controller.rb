class WelcomeController < ApplicationController
  def index
    render json: {status: 200, message: 'Perfect Excuse API'}
  end
end
