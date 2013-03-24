require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  # ALL THESE TESTS SHOULD FUNCTION THE SAME

  test "new and save" do
    assert_difference('Category.count') do
      category = Category.new(full_name: 'root/test')
      category.save
    end
  end

  test "create" do
    assert_difference('Category.count') do
      category = Category.create(full_name: 'root/test')
    end
  end

  test "where initialize save" do
    assert_difference('Category.count') do
      category = Category.where(full_name: 'root/test').new
      category.save
    end
  end

  test "where create" do
    assert_difference('Category.count') do
      category = Category.where(full_name: 'root/test').create
    end
  end

end
