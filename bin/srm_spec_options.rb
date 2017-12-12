require 'optparse'

# Parse all the command line/default options to create options.
class SrmSpecOptions
  attr_reader :spec, :top

  def initialize(argv)
    OptionParser.new do |opts|
      opts.banner = "Usage: -s <spec_file> -t <top_level> [options]"
      opts.on("-s" , "--spec filename", "Spec file name") do |s|
        @spec = s
      end
      opts.on("-t" , "--top TopRegBlock", "Class name of top reg block") do |t|
        @top = t 
      end
    end.parse!(argv)
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
