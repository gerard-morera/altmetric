module Validators
  module Properties
    class Articles
      def initialize data
        @data = data
      end

      def call
        true
      end 

      private

      attr_reader :data
    end
  end
end