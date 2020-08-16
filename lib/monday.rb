require 'zeitwerk'

module Monday
  loader = Zeitwerk::Loader.new
  loader.tag = File.basename(__FILE__, '.rb')
  loader.push_dir(__dir__)
  loader.setup
end