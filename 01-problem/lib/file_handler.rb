require 'pry'

class FileHandler
  def initialize path
    @path = path
  end

  def open
    if valid?
      File.open(absolute_path)
    else
      raise "#{ absolute_path } can not be found"
    end
  end

  private

  def absolute_path
    @absolute_path ||= File.expand_path("#{ path }", dir_path)
  end

  def dir_path
    "/Users/gerardmorera/altmetric-test/01-problem/resources/"
  end

  def valid?
    File.exist? absolute_path
  end

  attr_reader :path
end