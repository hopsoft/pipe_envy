require_relative "./pipe_envy/version"

PIPE_ENVY_PIPE = -> (arg) do
  #puts "#{self.class.name}, arg=#{arg.inspect}"
  if arg.is_a?(Array)
    method = arg.shift
    block  = arg.pop if arg.last.is_a?(Proc)
    args   = arg
  end
  method ||= arg
  args   ||= []

  #puts "#{self.class.name}, method=#{method.inspect}, args=#{args.inspect}, block=#{block.inspect}"
  if method.is_a?(Method)
    result = method.call(*([self] + args), &block)
  else
    result = send(method, *args, &block)
  end
  #puts "#{self.class.name}, method=#{method.inspect}, args=#{args.inspect}, block=#{block.inspect}, result=#{result.inspect}"
  #puts
  result
end

module PipeEnvy
  refine Object do
    define_method :|, &PIPE_ENVY_PIPE
  end

  refine Array do
    define_method :|, &PIPE_ENVY_PIPE
  end

  refine Integer do
    define_method :|, &PIPE_ENVY_PIPE
  end
end
