require 'file'

describe File do
  let(:path)          { double 'path' }  
  let(:absolute_path) { "/Users/gerardmorera/altmetric-test/01-problem/resources/#[Double \"path\"]" }

  subject { described_class.new path }

  describe 'open' do 
    context "with a valid path file" do
      before do
        allow(File).to receive(:exist?).with(absolute_path).
          and_return true
      end

      it 'opens the file' do
        expect { File.to receive(:open).with(absolute_path) } 

        subject.open
      end
    end

    context "with a invalid path file" do
      before do
        allow(File).to receive(:exist?).with(absolute_path).
          and_return false
      end

      it 'raises error' do
        expect do 
          subject.open
        end.
        to raise_error("#{ absolute_path } can not be found")
      end
    end
  end
end