require_relative '../validators/issn.rb'
require_relative '../validators/journals/title.rb'
require_relative '../initialitzator/nil_if_initialitzation_fails.rb'

class InitializationInvalidError < StandardError; end

module Resources
  class Journals
    extend NilIfInitializationFails
    
    attr_reader :title, :issn
    
    def initialize data, title_validator: Validators::Journals::Title.new, issn_validator: Validators::Issn.new
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