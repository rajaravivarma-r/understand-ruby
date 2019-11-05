# frozen_string_literal: true

# Module with a module function which will help decorating instance methods
module DependencyDefinitions
  def self.execute_once(method_name)
    class_eval do
      original_method = instance_method(method_name)
      define_method(method_name) do |*args|
        called_once_flag = "@_#{method_name}_called_once"
        return if instance_variable_get(called_once_flag)

        instance_variable_set(called_once_flag, true)
        original_method.bind(self).call(*args)
      end
    end
  end

  def dependency_one
    puts "dependency_one called from #{self.class} #{@value}"
  end
  execute_once :dependency_one
end

class Workflow
  include DependencyDefinitions

  def initialize(value)
    @value = value
  end
end

class SubWorkflow < Workflow
end

wf = Workflow.new('from base workflow')
wf.dependency_one
wf.dependency_one
wf.dependency_one

swf = SubWorkflow.new('from sub workflow one')
swf.dependency_one
swf.dependency_one

another_swf = SubWorkflow.new('from sub workflow two')
another_swf.dependency_one
