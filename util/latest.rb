#!/usr/bin/env ruby

unless ARGV.length == 1
  $stderr.puts """USAGE: #{$0} [SUBDIRECTORY]
  - obtains the the latest tag from [SUBDIRECTORY], assuming [SUBDIRECTORY] 
    contains subdirectories of tag names"""
  exit 2
end

subdir = ARGV[0]
unless Dir.exist? subdir
  $stderr.puts "ERROR: subdirectory '#{subdir}' does not exist"
  exit 1
end

tagdirs = Dir.glob("#{subdir}/*/")
unless tagdirs.length > 0
  $stderr.puts "ERROR: subdirectory '#{subdir}' has no subdirectories"
  exit 1
end

puts tagdirs.map{ |v|
  begin
    Gem::Version.new File.basename(v)
  rescue
    Gem::Version.new '0.0.0'
  end
}.max
