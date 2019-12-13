require_relative('../db/sql_runner')

class Designer

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @markup_return = options['markup_return']
  end 

end
