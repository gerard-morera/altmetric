module NilIfInitializationFails
  def new_if_valid data
    self.new data
  rescue InitializationInvalidError
    nil
  end
end
  
class InitializationInvalidError < StandardError; end

