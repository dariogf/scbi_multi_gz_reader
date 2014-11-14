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

			#reached END, check if there is more data to read
			unused = @io.unused

			@io.finish

			# there is something left to read, open another stream
			if !unused.nil?
				#puts "FIN1, fpos: #{@file.pos}, unused: #{unused.length}, io_eof: #{@io.eof}, eof: #{@file.eof}"
			
				@file.pos -= unused.length
				@io = Zlib::GzipReader.new @file
				#repeat the read so there is no eof error
				res=readline

			else
				#no more data to read, return nil
				res=nil
			end
		end

		return res
	end

	def eof?
		#nothing more to read
		@io.unused.nil? && (@io.closed? || @io.eof?) && (@file.closed? || @file.eof?)
	end

	def close
		#@io.finish
		@file.close
	end

end
