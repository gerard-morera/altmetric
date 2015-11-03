require 'file_processor/csv'

describe FileProcessor::Csv do
  let(:object_1)       { double 'object_1' }
  let(:object_2)       { double 'object_2' }
  
  let(:data)           { [object_1, object_2] }
  let(:builder_class)  { double 'builder_class' }
  
  let(:new_model)      { double 'new_model' }
  let(:model)          { double 'model' }
  
  let(:flat_object)    { double 'flat_object' }
  let(:parsed_line)    { double 'parsed_line', flatten: flat_object }

  subject { described_class.new data, builder_class }

  before do
    allow(CSV).to receive(:parse).
      with(object_1).and_return(parsed_line)
    allow(CSV).to receive(:parse).
      with(object_2).and_return(parsed_line)
    allow(builder_class).to receive(:new).
      with(flat_object).and_return( new_model )
    allow(new_model).to receive(:call).
      and_return(model)
  end

  describe 'call' do
    context 'with valid data' do
      it 'instanciates builder_class with arguments for every line' do
        expect(subject.call).to eq([model, model])
      end 
    end
  end
end