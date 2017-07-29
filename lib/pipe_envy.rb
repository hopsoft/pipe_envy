require_relative "./pipe_envy/version"

module PipeEnvy
  def self.refine_pipe(klass)
    refine klass do
      define_method :| do |arg|
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
    end
  end

  refine_pipe Object
  refine_pipe Array
  refine_pipe Integer
  refine_pipe Tempfile
  refine_pipe Nokogiri::XML::NodeSet if defined? Nokogiri::XML::NodeSet
end
