require 'optparse'

# Parse all the command line/default options to create options.
class SrmSpecOptions
  attr_reader :spec, :top, :out, :name

  def initialize(argv)
    @out = "srm_registers.json"
    OptionParser.new do |opts|
      opts.banner = "Usage: -s <spec_file> -t <top_level> [options]"
      opts.on("-s" , "--spec filename", "Spec file name") do |s|
        @spec = s
      end
      opts.on("-t" , "--top TopRegBlock", "Class name of top reg block") do |t|
        @top = t 
      end
      opts.on("-n" , "--name NameOfTopBlock", "Instance name of top reg block") do |n|
        @name = n
      end
      opts.on("-o" , "--out OutputJsonFile", "Output json file name") do |o|
        @out = o 
      end

    end.parse!(argv)
    @name ||= @top 
    abort "Missing spec file name. Use \'-s\' to specify it." unless @spec
    abort "Missing top register block name. Use \`t\` to specify it." unless @top

    # Eval does not work with require_relative (since there is no file). Hence we
    # add the path to the top level to the load path.
    $LOAD_PATH << File.dirname(spec)

    # Similarly the srm gem may not be installed but part of simple_reg_model repo,
    # hence we add it to the path.
    $LOAD_PATH << "../lib"
  end

end
