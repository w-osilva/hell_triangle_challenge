require 'app_helper'

RSpec.describe Triangle, :type => :model do

  describe ".new" do
    context "witH valid parameter" do
      subject(:triangle) { Triangle.new([[6],[3,5],[9,7,1],[4,6,8,4]]) }
      it { expect(triangle).to be_instance_of Triangle }
    end

    context "witH invalid parameter" do
      let(:body_invalid){ Hash.new }
      let(:first_row_invalid_index_type ){ ["foo", [3,5]] }
      let(:first_row_invalid_index_size ){ [[3,5], [3,5]] }
      let(:first_row_invalid_value ){ [["foo"], [3,5]] }

      it { expect { Triangle.new(body_invalid) }.to raise_error( TriangleError, /Expected an array of arrays/ ) }
      it { expect { Triangle.new(first_row_invalid_index_type) }.to raise_error( TriangleError, /Row\[0\] Expected an array/ ) }
      it { expect { Triangle.new(first_row_invalid_index_size) }.to raise_error( TriangleError, /Row\[0\] Expected that the array contains 1 indexes/ ) }
      it { expect { Triangle.new(first_row_invalid_value) }.to raise_error( TriangleError, /Row\[0\] Expected that the array contains all integer values/ ) }
    end
  end


  describe "#process" do
    subject(:triangle) { Triangle.new([[6],[3,5],[9,7,1],[4,6,8,4]]) }
    let!(:process) {triangle.process}

    specify "Should generate an array with max_indexes" do
      expect(triangle.max_indexes).to match_array [0, 1, 1, 2]
    end

    specify "Should generate an array with max_values" do
      expect(triangle.max_values).to match_array [6, 5, 7, 8]
    end

    specify "Should generate the sum of the max_values" do
      expect(triangle.total).to be 26
    end
  end

end
