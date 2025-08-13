require "string_calculator"

RSpec.describe StringCalculator do
  subject(:calc) { described_class.new }

  describe "#add" do
    it 'returns 0 for an empty string: "" => 0' do
      expect(calc.add("")).to eq(0)
    end

    it "returns the number for a single numeric string" do
      expect(calc.add("1")).to eq(1)
      expect(calc.add("7")).to eq(7)
    end

    it 'sums two comma-separated numbers: "1,2" => 3' do
      expect(calc.add("1,2")).to eq(3)
      expect(calc.add("10,5")).to eq(15)
    end

    it "sums any amount of comma-separated numbers" do
      expect(calc.add("1,2,3,4")).to eq(10)
      expect(calc.add("5,5,5,5,5")).to eq(25)
    end

    it 'accepts newline as a delimiter along with commas (e.g. "1\n2,3")' do
      expect(calc.add("1\n2,3")).to eq(6)
      expect(calc.add("4\n1\n2")).to eq(7)
    end
  end
end