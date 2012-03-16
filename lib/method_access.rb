require "method_access/version"
require "hash_ext"

module MethodAccess
  class Hash < ::Hash
    def method_missing(key, *args, &block)
      args << block if block_given?
      key = [key] + args if args.any?
      self[key]
    end
  end
end
