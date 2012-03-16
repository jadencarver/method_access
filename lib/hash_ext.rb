class ::Hash
  def with_method_access(&block)
    MethodAccess::Hash.new.tap do |new_hash|
      new_hash.update(self)
      if block.present?
        new_hash.default_proc = block
      elsif default_proc.present?
        new_hash.default_proc = default_proc
      elsif default.present?
        new_hash.default = default
      end
    end
  end
end
