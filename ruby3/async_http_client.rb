#!/usr/bin/env ruby

require 'benchmark'

require 'async'
require 'async/barrier'
require 'async/http/internet'

def main
  results = []
  Async do
    internet = Async::HTTP::Internet.new
    barrier = Async::Barrier.new

    # Spawn an asynchronous task for each topic:
    (1..600).each do |int|
      barrier.async do
        req_time = Benchmark.realtime do
          response = internet.get("https://httpdump.io/_7krb?param1=value1&param2=#{int}")
          response.read
        end
        results << req_time
      end
    end

    # Ensure we wait for all requests to complete before continuing:
    barrier.wait
  ensure
    internet&.close
  end
  puts results
  puts "Sum of all individual requests: #{results.sum}"
  puts "Max of all individual requests: #{results.max}"
  puts
end

time = Benchmark.realtime do
  main
end

puts "Total time taken: #{time}"
