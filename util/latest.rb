#!/usr/bin/env ruby

if ARGV.length < 2
  $stderr.puts """USAGE: #{$0} [SUBDIRECTORY] [CONFIG_BASENAME] [OUTPUT]
  - obtain the latest version of the config file with basename [CONFIG] from
    [SUBDIRECTORY], assuming [SUBDIRECTORY] contains subdirectories of tag names
  - tag names that are not semantic version numbers, such as `dev`, are ignored
  - [OUTPUT] may be either:
    'file':     return the file name (default behavior)
    'version':  return just the version number
    'both':     return both file name and version number
  """
  exit 2
end

subdir, config = ARGV[0..1]
output = ARGV.length >= 3 ? ARGV[2] : 'file'
unless Dir.exist? subdir
  $stderr.puts "ERROR: subdirectory '#{subdir}' does not exist"
  exit 1
end

# get list of tag subdirectories and sort them by semantic version number
# - excludes directories which are not version numbers
tagdirs = Dir.glob("#{subdir}/*/").map{ |v|
  begin
    Gem::Version.new File.basename(v)
  rescue
    nil
  end
}
  .compact
  .sort
  .reverse
  .map &:to_s

if tagdirs.empty?
  $stderr.puts "ERROR: subdirectory '#{subdir}' has no subdirectories with semantic version numbers"
  exit 1
end

# find the config files with the requested basename
results = Array.new
tagdirs.each do |v|
  configFile = Dir.glob("#{subdir}/#{v}/*").find{ |f|
    File.basename(f).match? /^#{config}\./
  }
  results << { :version=>v, :file=>configFile } unless configFile.nil?
end

if results.empty?
  $stderr.puts "ERROR: cannot find config file with basename '#{config}' in any versioned subdirectory of '#{subdir}'"
  exit 1
end

# return the latest version of that config file
result = results.first
case output
when 'file'
  puts result[:file]
when 'version'
  puts result[:version]
when 'both'
  puts result[:file] + ' ' + result[:version]
else
  $stderr.puts "ERROR: unknown [OUTPUT] '#{output}'"
  exit 1
end
