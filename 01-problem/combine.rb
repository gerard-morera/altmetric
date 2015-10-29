require_relative 'lib/file.rb'
require_relative 'lib/path_identifier.rb'

class Combine
  def path_identifier
    PathIdentifier.new
  end
end

combine = Combine.new
combine.path_identifier 