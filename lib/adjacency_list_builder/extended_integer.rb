class AdjacencyListBuilder
  class ExtendedInteger
    def initialize(str)
      @int = str.to_i
    end

    def options
      @options ||= {}
    end

    def label=(label)
      options[:label] = label
    end

    def label
      options[:label]
    end

    def to_int
      @int
    end

    def inspect
      @int.inspect
    end

    def to_s
      @int.to_s
    end

    def preview
      "#{@int} => #{label}"
    end

    def method_missing(m, *args, &block)
      @int.send(m, *args, &block)
    end
  end
end
