require "minitest/autorun"

def run_tests(alg, doc)
  puts
  puts doc
  puts
  describe "##{alg.to_s}" do
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
