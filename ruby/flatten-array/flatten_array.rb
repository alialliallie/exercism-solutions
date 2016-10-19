module FlattenArray
  VERSION = 1

  module_function

  def flatten(array)
    array.reduce([]) do |flat, element|
      flat + if element.is_a? Array
               flatten(element)
             else
               element.nil? ? [] : [element]
             end
    end
  end
end
