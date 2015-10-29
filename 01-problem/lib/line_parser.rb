class LineParser
  include Enumerable

  def initialize file
    @file = file
  end

  def each
    File.readlines(file).each do |line|  
      yield line
    end
  end

  attr_reader :file
end