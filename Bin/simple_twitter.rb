#!/usr/bin/env ruby

require('pp')
require('optparse')
require('simple_twitter')


class InterfaceUser
  def initialize
    @searcher = SimpleTwitter::Search.new

    OptionParser.new do |parser|
      parser.banner = "Usage: simple-twitter [options] search-query"

      parser.on('-h', '--help', 'This message') do
        $stdout.puts(parser)
        exit
      end

      parser.on('-r', '--results-per-page=COUNT', 'Return COUNT tweets') do |rpp|
        @searcher.results_per_page = rpp.to_i
      end
    end.parse!(ARGV)
  end
    if ARGV.empty?
      $stderr.puts("Please put what you want to search in your command
      line")
      exit(1)
    end

    ARGV.each do |query|
      pp(@searcher.search(query))
    end
  end

################################################################################
UserInterface.new.run
