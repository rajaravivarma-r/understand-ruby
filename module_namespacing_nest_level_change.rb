module InitiallyNotNested
  class A
    def print
      puts 'From A'
    end
  end
end

module NewParentNamespace
  module InitiallyNotNested
    class B
      def print
        puts 'From B'
      end
    end
  end
end

a = InitiallyNotNested::A.new
a.print
b = NewParentNamespace::InitiallyNotNested::B.new
b.print

# Verdict: Changing nesting does not seem to affect the code
