module Validators
  module Articles
    class Doi
      def call value
        value.include('/')
      end
    end
  end
end

# to be improved at some moment