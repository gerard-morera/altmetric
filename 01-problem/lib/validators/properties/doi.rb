module Validators
  module Properties
    class Doi
      def initialize data
        @data = data
      end

      def call 
        data.include?('/')
      end

      private

      attr_reader :data
    end
  end
end