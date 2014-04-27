require "minitest/autorun"

def run_tests(alg)
  describe "#insertion_sort" do
    it "sorts no elements" do
      @c = []
    end

    it "sorts a single element" do
      @c = [1]
    end

    it "sorts many elements" do
      @c = Array.new(100) { rand(100) }
    end

    after(:each) { send(alg, @c).must_equal(@c.sort) }
  end
end
