# frozen_string_literal: true

# top-level comment to satisfy Rubocop
class SimpleLinkedList
  def initialize
    @list = []
  end

  def size
    @list.size
  end

  def empty?
    @list.empty?
  end

  def push(element)
    @list.each { |ele| ele.tail = false }
    @list.unshift Element.new(element, head)
    @list.last.tail = true
  end

  def peek
    return nil if empty?

    head.datum
  end

  def head
    @list.first
  end

  def pop
    @list.shift.datum
  end

  def to_a
    @list.map(&:datum)
  end

  def self.from_a(array)
    list = SimpleLinkedList.new
    array ||= []

    array.reverse.each do |num|
      list.push(num)
    end
    list
  end

  def reverse
    SimpleLinkedList.from_a(to_a.reverse)
  end
end

class Element
  attr_reader :datum, :next
  attr_accessor :tail

  def initialize(num1, num2 = nil)
    @datum = num1
    @next = num2
    @tail = true
  end

  def tail?
    tail
  end
end
