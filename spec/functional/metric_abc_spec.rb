require 'spec_helper'

describe MetricABC, "initialization" do

  it "should read passed file and generate AST for it on initialization" do
    metric = MetricABC.new(File.join(File.dirname(__FILE__), "..", "fixtures", "example.rb"))
    metric.ast.should be_instance_of(Array)
    metric.ast.should_not be_empty
  end

  it "should throw exception when file is not found" do
    lambda{ MetricABC.new(File.join(File.dirname(__FILE__), "..", "fixtures", "not_found.rb"))}.should raise_exception
  end

  it "should throw exception when file is not valid" do
    expect{ MetricABC.new(File.expand_path('../../fixtures/not_valid.rb', __FILE__)) }.to raise_error(MetricABC::InvalidCode)
  end
end

describe MetricABC, "calculating" do
  before :each do
    @file_name = File.join(File.dirname(__FILE__), "..", "fixtures", "example.rb")
    @metric = MetricABC.new(@file_name)
  end

  it "should have 1 complexity for simple function" do
    @metric.complexity["#{@file_name} > Example > simple_function"].should eql(1)
  end

  it "should recognize top level functions" do
    @metric.complexity["#{@file_name} > outside_function"].should_not be_nil
  end

  it "should recognize modules functions" do
    @metric.complexity["#{@file_name} > Test > Test2 > class_in_module_function"].should_not be_nil
  end

  it "should have complexity of 7 for medium method" do
    @metric.complexity["#{@file_name} > Example > medium_function"].should eql(7)
  end
end
