require 'line_parser'

describe LineParser do
  let(:file)        { double 'file' }
  let(:lines_array) { [1,2,3,4] }

  subject { described_class.new file }

  before do
    allow(File).to receive(:readlines).
      with(file).and_return(lines_array)
  end

  describe 'each' do
    yielded = []
    it 'yields elements of the array' do
      subject.each { |e| yielded << e }
      
      expect(yielded).to eq([1,2,3,4])
    end
  end
end
