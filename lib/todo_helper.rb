
module TodoHelper

  def update_count
    puts "I called the update_count method"
    @todos = Todo.where :list_name => Todo.last.list_name
    @todos.each do |todo|
      todo.update_attributes :todo_count => @todos.count
    end
  end

end
