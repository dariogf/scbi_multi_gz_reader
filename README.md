# ScbiMultiGzReader

Zlib::GzipReader is not able to read multiple stream gz/gzip files, instead it only reads the first stream and then closes the file without warnings so you only get a part of the file when you expected to get the full one.

This is a wrapper to read gz/gzip files  composed of multiple streams (eg, made by doing a cat to join some gz files in a bigger one.

By now it only has the readline and eof? instance methods, the ones needed by scbi_fastq to read fastq files.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'scbi_multi_gz_reader'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install scbi_multi_gz_reader

## Usage

	# read checking for eof

	file=MultiGzReader.new('file.gz'))
    
    while !file.eof? do
      puts file.readline
    end 

    file.close

    ------

    # read checking for res.nil?
	file=MultiGzReader.new('file.gz'))
    
	loop do
      res=file.readline
      break if res.nil?
      puts res
    end

    file.close


## Contributing

1. Fork it ( https://github.com/[my-github-username]/scbi_multi_gz_reader/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
