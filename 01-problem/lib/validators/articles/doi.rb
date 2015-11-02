module Validators
  module Articles
    class Doi
      def call value
        if value
          value.include?('/')
        else  
          false
        end
      end
    end
  end
end

# to be improved at some moment