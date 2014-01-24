require 'purge'

class PlayerController < ApplicationController
  include Purge

  def index
  	@type   = params[:type]
  	@number = params[:number]

  	#set_concurrent_player
  	set_concurrent_players
  	purge
  end

  private

  def set_concurrent_players
  	set_wp_option @type, @number
  end
end