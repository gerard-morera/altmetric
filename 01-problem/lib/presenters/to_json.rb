module Presenters
  class ToJson
    def initialize collection
      @collection = collection
    end

    def call
      puts collection.map { |line| as_json line }.inspect
    end

    private

    def as_json line
      {
        "issn"    => line[0],
        "title"   => line[1],
        "doi"     => line[2],
        "author"  => line[3],
        "journal" => line[4]
      }
    end

    attr_reader :collection
  end
end
