require 'pry'

module Validators
  module Properties
    class Issn
      def initialize data
        @data = data
      end

      def call
        if data.include?('-')
          valid_with_hyphen?
        else
          valid_without_hyphen?
        end
      end

      private

      def valid_with_hyphen?
        first, last = data.chomp.split('-')

        first.length == 4 && last.length ==4
      end

      def valid_without_hyphen?
        data.chomp.length == 8
      end

      attr_reader :data
    end
  end
end