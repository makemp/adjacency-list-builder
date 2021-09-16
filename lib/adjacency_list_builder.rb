require_relative 'adjacency_list_builder/extended_integer'

class AdjacencyListBuilder
  def initialize(n, graph_string)
    @n = n # node count
    @graph_string = graph_string
    @adjacency_list = Array.new(n) { [] }
  end

  def call(directed: false)
    parsed_graph_string.each do |tuple|
      # first element is node number, second which element it connects, third is a numeric label
      index, connected_with, num_label = tuple.map(&:to_i)

      if connected_with
        if num_label
          connected_with = ExtendedInteger.new(connected_with)
          connected_with.label = num_label
        end
        adjacency_list[index].push connected_with
        adjacency_list[connected_with].push index unless directed
      end
    end

    adjacency_list
  end

  private

  attr_reader :n, :graph_string, :adjacency_list

  def parsed_graph_string
    @parsed_graph_string ||= graph_string.split("\n").map { |tuple| tuple.split(' ') }
  end
end


