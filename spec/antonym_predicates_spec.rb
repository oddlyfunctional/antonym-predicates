require 'rspec'
require 'antonym_predicates'

describe AntonymPredicates do
  before(:each) do
    class MyClass

      def self.something_true?
        true
      end

      def something_false?
        false
      end

      def self.left?
        true
      end

      def up?
        true
      end
    end
  end

  after(:each) do
    Object.send :remove_const, :MyClass
  end

  it 'should be able to generate antonym methods with "not_method?" form, for both class and instance' do
    AntonymPredicates.generate_antonyms MyClass
    MyClass.should respond_to :not_something_true?
    MyClass.not_something_true?.should be_false
    obj = MyClass.new
    obj.should respond_to :not_something_false?
    obj.not_something_false?.should be_true
  end

  it "should be able to generate antonym methods from dictionary, for both class and instance" do
    AntonymPredicates.antonyms = {
      "left"  => "right",
      "up"    => "down"
    }
    AntonymPredicates.generate_antonyms MyClass
    MyClass.should respond_to :right?
    MyClass.right?.should be_false
    obj = MyClass.new
    obj.should respond_to :down?
    obj.down?.should be_false
  end

  it "should be able to generate antonym methods for more than one class" do
    class MyOtherClass

      def self.someone?
        true
      end
    end
    AntonymPredicates.generate_antonyms MyClass, MyOtherClass
    MyClass.should respond_to :not_something_true?
    MyOtherClass.should respond_to :not_someone?
  end

  it "should be able to generate antonym methods for an instance" do
    obj = MyClass.new
    AntonymPredicates.generate_antonyms obj
    obj.should respond_to :down?
    other_obj = MyClass.new
    other_obj.should_not respond_to :down?
  end
end

