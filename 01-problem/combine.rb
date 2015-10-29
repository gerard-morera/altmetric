require_relative 'lib/file_handler.rb'
require_relative 'lib/path_identifier.rb'
require_relative 'lib/line_parser.rb'

class Combine
  def path_identifier
    PathIdentifier.new
  end
end

combine = Combine.new
combine.path_identifier 