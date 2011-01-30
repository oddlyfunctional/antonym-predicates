module AntonymPredicates

  @antonyms ||= {}

  def self.antonyms
    @antonyms
  end

  def self.antonyms=(antonyms)
    @antonyms = antonyms
  end

  #  @antonyms = {
  #    "equal" => "different",
  #    "is_a" => "isnt_a",
  #    "respond_to" => "doesnt_respond_to",
  #    "nil" => "exists"
  #  }

  def self.generate_antonyms(*classes)
    classes.each do |c|
      c.methods.grep(/^(?!not_).*\?$/).each do |method|
        if @antonyms[method.to_s.chop].nil?
          new_method = "not_#{method}"
        else
          new_method = @antonyms[method.to_s.chop] + "?"
        end
        c.instance_eval <<-RUBY
        def self.#{new_method}(*args)
          not #{method}(*args)
        end
        RUBY
      end
      if c.respond_to? :instance_methods
        c.instance_methods.grep(/^(?!not_).*\?$/).each do |method|
          if @antonyms[method.to_s.chop].nil?
            new_method = "not_#{method}"
          else
            new_method = @antonyms[method.to_s.chop] + "?"
          end
          c.class_eval <<-RUBY
          def #{new_method}(*args)
            not #{method}(*args)
          end
          RUBY
        end
      end
    end
  end

end

