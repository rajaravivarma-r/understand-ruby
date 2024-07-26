puts 'Starting benchmarking'

V = Struct.new(:a, :b)
N = 9_00_000

Benchmark.bmbm do |x|
  x.report('Struct: ') do
    N.times { V.new(1, 2).a }
  end

  x.report('OpenStruct: ') do
    N.times { OpenStruct.new({a: 1, b: 2}).a }
  end
end
