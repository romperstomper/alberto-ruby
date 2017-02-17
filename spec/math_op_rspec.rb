require 'rspec'
require_relative '../math_op'

describe MathOp do
  subject(:math) { described_class }

  describe '#add_numbers' do
    subject { math.add_numbers(num1, num2) }
    let(:num1) {0}
    let(:num2) {0}

    context 'when using 0 and 0' do
      it('adds my numbers') { is_expected.to eq(0) }
    end
              
    it 'adds 2 ints' do
      expect(math.add_numbers(2,3)).to eq(5)
    end

    [[1,2,3], [2,3,5]].each do |n1, n2, num3|
      context "when using #{n1} and #{n2}" do
        let(:num1) { n1 }
        let(:num2)   { n2 }
        let(:result) { num3 }

        it { is_expected.to eq(result) }
      end
    end
  end
end


describe MathOp do
  describe '#add_numbers' do
    it 'adds 2 ints' do
      expect(MathOp.add_numbers(2,3)).to eq(5)
    end
  end
end

