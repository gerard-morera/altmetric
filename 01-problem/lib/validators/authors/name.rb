module Validators
  module Authors
    class Name
      def call value
        value != "no_name"
      end
    end
  end
end