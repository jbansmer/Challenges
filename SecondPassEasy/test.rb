def meth(&block)
  block.call
  meth2(block)
end

def meth2(block)
  block.call
  # yield
end

meth { p 'from meth1' }
