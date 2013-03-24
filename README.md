rails_create_differences
========================

Testing differences in rails create methods.

The model unit tests fail on the appropriate code.
The following code snippet can be run from the rails console to show the problem.

```ruby
# Creating a root node
root = Category.create(full_name: 'root')

# Creating first child node, should have root first root as the parent
# This works as expected
foo = Category.create(full_name: 'root/foo')

# Creating another child node, should have root first root as the parent
# This doesn't work as expected, it seems to "inherit" the ActiveRecord::Relation
bar = Category.where(full_name: 'root/bar').create
```

When running the above from the console it shows the SQL output.
The problematic line seems to be inheriting the ActiveReocrd::Relation and running something like:

```ruby
# Runs this (basically)
Category.where(first_name: 'root/bar').where(first_name: 'root').first_or_create

# Instead of this
Category.where(first_name: 'root').first_or_create
```

This prior where clause is what was originally passed in to create ```bar```.
