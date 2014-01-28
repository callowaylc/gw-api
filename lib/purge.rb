module Purge
	def purge
		begin
		  	%w{ web0 web1 }.each do | ip |
				c = Net::Telnet::new(
				  "Host" => ip,
				  "Port" => 8383
				)
				c.puts 'varnish'
				c.close

		  	end
		 rescue
		 end
	end
end
