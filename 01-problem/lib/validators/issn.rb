require 'pry'

module Validators
  class Issn
    def call code
      if code.include?('-')
        valid_with_hyphen? code
      else
        valid_without_hyphen? code
      end
    end

    private

    def valid_with_hyphen? code
      first, last = code.chomp.split('-')

      first.length == 4 && last.length ==4
    end

    def valid_without_hyphen? code
      code.chomp.length == 8
    end
  end
end