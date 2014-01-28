require 'purge'

class CacheController < ApplicationController
  include Purge

  def purge
    super    
  end
end
