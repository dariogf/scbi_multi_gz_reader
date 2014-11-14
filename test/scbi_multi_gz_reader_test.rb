require File.dirname(__FILE__) + '/test_helper.rb'

class ScbiMultiGzReaderTest < Test::Unit::TestCase

  def setup

  end

  def test_mini_multi_gz_reader

    # test a file with multiple gz streams

    file=MultiGzReader.new(File.join(File.dirname(__FILE__),'minitest.fastq.gz'))
    
    i=0

    loop do
      res=file.readline
      #puts res
      break if res.nil?
      i = i+1
    end

    file.close

    assert_equal(28,i)

  end


  def test_mini_multi_gz_reader_EOF_while

    # test a file with multiple gz streams

    file=MultiGzReader.new(File.join(File.dirname(__FILE__),'minitest.fastq.gz'))
    
    i=0

    begin
      res=file.readline
      #puts res
      i = i+1
    end while !file.eof?

    file.close

    assert_equal(28,i)

  end

  def test_mini_multi_gz_reader_EOF_until

    # test a file with multiple gz streams

    file=MultiGzReader.new(File.join(File.dirname(__FILE__),'minitest.fastq.gz'))
    
    i=0

    begin
      res=file.readline
      #puts res
      i = i+1
    end until file.eof?

    file.close

    assert_equal(28,i)

  end

def test_empty_multi_gz_reader_EOF_until

    # test a file with multiple gz streams

    file=MultiGzReader.new(File.join(File.dirname(__FILE__),'empty.fastq.gz'))
    
    i=0

    while !file.eof? do
      res=file.readline
      #puts res
      i = i+1
    end 

    file.close

    assert_equal(0,i)

  end


  def test_mini_complete_gz
    #test only one gz stream in file

    file=MultiGzReader.new(File.join(File.dirname(__FILE__),'minitest_full.fastq.gz'))
    
    i=0

    loop do
      res=file.readline
      #puts res
      break if res.nil?
      i = i+1
    end

    file.close

    assert_equal(i,28)

  end

  
end
