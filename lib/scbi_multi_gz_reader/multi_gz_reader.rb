require 'zlib'

class MultiGzReader

	def initialize(file_name)
		@file = File.open(file_name)
		@io = Zlib::GzipReader.new @file
	end

	def readline

		res=nil

		begin
			res=@io.readline
		rescue EOFError => e

			#final alcanzado, ver si queda algo por leer
			unused = @io.unused
			@io.finish

			#queda algo por leer
			if !unused.nil?
				#puts "FIN1, fpos: #{@file.pos}, unused: #{unused.length}"

				@file.pos -= unused.length
				#puts "OPEN2, fpos: #{@file.pos}, unused: #{unused.length}"

				@io = Zlib::GzipReader.new @file
				res=@io.readline
			else 
				res=nil
			end

		end

		return res
	end

	def close
		#@io.finish
		@file.close
	end

end
