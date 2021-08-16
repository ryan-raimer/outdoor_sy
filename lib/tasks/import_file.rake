# frozen_string_literal: true

require 'optparse'

desc 'Import a customer and vehicle data file'
task :import_file, %i[file_path delimiter] => :environment do |_t|
  options = {}
  opts = OptionParser.new
  opts.banner = 'Usage: rake import_file [options]'
  opts.on('-f', '--file_path ARG', 'Path to the file to import') do |file_path|
    options[:file_path] = file_path
  end
  opts.on('-d', '--delimiter ARG', 'Delimiter for file (pipes and commas can be auto-detected)') do |delimiter|
    options[:delimiter] = delimiter
  end
  opts.on('-h', '--help', 'Prints this help') { puts opts; exit }
  opts.parse!(opts.order!(ARGV) {})

  DataImport::CustomerWithVehicleFileImportService.new.import_file(options[:file_path], options[:delimiter])

  exit
end
