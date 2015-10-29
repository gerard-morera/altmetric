require 'pry'

class PathIdentifier
  def journals
    ARGV[0]
  end

  def articles
    ARGV[1]
  end

  def authors
    ARGV[2]
  end
end