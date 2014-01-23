class PlayerController < ApplicationController
  def index
  	@player = params[:type]
  	@number = params[:number]

  end

  private

  def set
  end
end
