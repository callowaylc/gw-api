class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :determine_application

  protected 

  	# until we determine different method for using
  	# multiple databases, will be returning adapter
  	# directly from here based upon host
  	def db
  		if @db.nil?
	  		username = /^api\.([^.]+)/.match(request.host)[1]
	  		database = username == 'elmundodigital' && 'elmundod_wdps1' ||
	  		                       'showbizdaily'

	  		# obviously this sucks, will be abstracted later
				@db = Mysql2::Client.new(
				  host:     'database',
				  username: username,
				  password: 'fe5180zz',
				  database: database,
				)
			end

			@db
  	end

  	# parses host from 
  	def determine_application
  		@application = /^api\.([^.]+)/.match(request.host)[1]
  	end

  	# sets key/value on wp_options
  	def set_wp_option(name, value)
  		result = db.query %{
  			SELECT wpo.option_id as id
  			FROM   wp_options wpo
  			WHERE  option_name = '#{name}'
  		}

  		# if option has not yet been inserted, then we 
  		# we need to insert it and get option id
  		if result.count == 0
  			db.query %{
  				INSERT INTO wp_options(
  					option_name, option_value

  				) VALUES (
  					'#{name}', '#{value}'
  				)
  			}
  			id = db.last_id
  		else
  			id = result.to_a[0][0]
  		end

  		# finally we need to update key/value
  		db.query %{
  			UPDATE wp_options SET
  				option_value = '#{value}'

  			WHERE
  				option_name = '#{name}'
  		}		


  	end
end
