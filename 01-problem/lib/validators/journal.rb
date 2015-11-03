require_relative './properties/title.rb'
require_relative './properties/issn.rb'

module Validators
  class Journal
    def initialize data, title_validator: Validators::Properties::Title, issn_validator: Validators::Properties::Issn
      @title, @issn  = data

      @title_validator = title_validator
      @issn_validator = issn_validator
    end

    def call
      title_valid? and issn_valid?
    end

    private

    def title_valid?
      validator = title_validator.new title
      validator.call
    end

    def issn_valid?
      validator = issn_validator.new issn
      validator.call
    end

    attr_reader :title, :issn, :title_validator, :issn_validator
  end
end