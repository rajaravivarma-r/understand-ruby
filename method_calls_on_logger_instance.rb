# frozen_string_literal: true

require 'logger'

logger = Logger.new($stdout)

trace = TracePoint.trace(:call) do |tp|
  tp.disable
  case tp.self.class.to_s
  when Logger.to_s
    method = tp.self.method(tp.method_id)
    puts method.name
    parameter_names = method.parameters.map(&:last)
    arguments = parameter_names.map { |name| tp.binding.eval(name.to_s) }
    puts parameter_names.zip(arguments).to_h
  end
  tp.enable
end
trace.enable

logger.debug('debug message')

logger.warn('warn message')

logger.info('info message')
