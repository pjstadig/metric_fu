require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Dcov do
  before :each do
    MetricFu::Dcov.stub!(:verify_dependencies!).and_return(true)
  end
  
  describe "emit method" do
    before :each do
      MetricFu::Configuration.run {|config| config.dcov = {:test_files => ['app/**/*.rb', 'lib/**/*.rb'],
                                                           :dcov_opt=>[]}}
      File.stub!(:directory?).and_return(true)
      @dcov = MetricFu::Dcov.new('base_dir')
    end
    
    it "should look at directories" do
      Dir.should_receive(:[]).with(File.join("app", "**/*.rb")).and_return("path/to/app")
      Dir.should_receive(:[]).with(File.join("lib", "**/*.rb")).and_return("path/to/lib")
      output = @dcov.emit
    end
    
  end
  
  #describe "analyze method" do
  #  
  #end
  #
  #describe "to_h method" do
  #  
  #end
  #
  #describe "underscore method" do
  #  
  #end
end