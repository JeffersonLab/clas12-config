#!/usr/bin/env ruby
# returns a JSON string, listing config files that are common between two directories
# - by default, matches the latest `coatjava` and `gemc` versions (must be called from top-level directory)
# - otherwise, specify the 2 directories

require 'json'

dirs = Array.new
case ARGV.length
when 0
  dirs = ['coatjava', 'gemc'].map{ |d| [d, `util/latest.rb #{d}`.chomp].join '/' }
when 2
  dirs = ARGV
else
  $stderr.puts "ERROR: either provide 2 directories, or none for the defaults"
  exit 2
end

files = dirs.map{ |d|
  ['gcard', 'yaml'].map{ |ext|
    Dir.glob("#{d}/*.#{ext}")
      .map{ |f| f.split('/')[-1].sub /\.#{ext}$/, '' }
  }.flatten
}

unless files.length==2
  $stderr.puts "ERROR: files array does not have 2 elements"
  exit 1
end

filesMatched = files[0].select{ |f| files[1].include? f }
puts JSON.generate({ 'config' => filesMatched })
