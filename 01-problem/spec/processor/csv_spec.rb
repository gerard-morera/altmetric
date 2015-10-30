require 'processor/csv'

describe Processor::Csv do
  let(:data)           { ["qwe,rty"] }
  let(:resource_class) { double 'resource_class' }
  let(:args)           { ["qwe","rty"] }
  let(:resource)       { double 'resource'}

  subject { described_class.new data, resource_class }

  describe 'call' do
    context 'with valid data' do
      before do
        allow(resource_class).to receive(:new_if_valid).
          with(args).and_return(resource)
      end

      it 'instanciates resource_class with arguments for every line' do
        expect(subject.call).to eq([resource])
      end 
    end
  
    context 'with invalid data' do
      before do
        allow(resource_class).to receive(:new_if_valid).
          with(args).and_return(nil)
      end

      it 'instanciates resource_class with arguments for every line' do
        expect(subject.call).to eq([nil])
      end 
    end
  end
end