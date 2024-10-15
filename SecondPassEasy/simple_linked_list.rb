class SimpleLinkedList
  def initialize
    @list = []
  end

  def push(number)
    @list << Element.new(number)
    reconfigure
  end

  def size
    @list.size
  end

  def empty?
    @list.empty?
  end

  def peek
    return nil if empty?

    @list.last.datum
  end

  def head
    @list.last
  end

  def pop
    @list.pop.datum
  end

  def self.from_a(array)
    array = [] if array.nil?

    list = SimpleLinkedList.new
    array.reverse.each { |element| list.push(element) }
    list
  end

  def to_a
    new_list = @list.reverse.map(&:datum)
  end

  def reverse
    self.class.from_a(to_a_no_reverse)
  end

  private

  def reconfigure
    @list.each_with_index do |element, idx|
      element.tail = false unless idx == 0
      element.next = @list[idx - 1]
    end
  end

  def to_a_no_reverse
    new_list = @list.map(&:datum)
    reconfigure
    new_list
  end
end

class Element
  attr_accessor :datum, :next, :tail

  def initialize(first, second = nil)
    @datum = first
    @next = second
    @tail = true
  end

  def tail?
    @tail
  end
end
