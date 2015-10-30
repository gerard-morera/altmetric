module Validators
  module Authors
    class Articles
      def call value
        value != "no_articles"
      end
    end
  end
end