require_relative '../validators/issn.rb'
require_relative '../validators/journals_title.rb'

class InitializationInvalidError < StandardError; end

module Resources
  class Journals
    attr_reader :title, :issn

    def self.new_if_valid data
      self.new data
    rescue InitializationInvalidError
      nil
    end
    
    def initialize data, title_validator: Validators::JournalsTitle.new, issn_validator: Validators::Issn.new
      @title, @issn = data

      @title_validator = title_validator
      @issn_validator  = issn_validator

      raise InitializationInvalidError unless valid?
    end

    private

    def valid?
        title_validator.call(title) && issn_validator.call(issn)
    end

    attr_reader :title_validator, :issn_validator
  end
end