require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  # ALL THESE TESTS SHOULD FUNCTION THE SAME

  test "new and save" do
    assert_difference('Category.count') do
      Category.new(full_name: 'root/test').save
    end
  end

  test "create" do
    assert_difference('Category.count') do
      Category.create(full_name: 'root/test')
    end
  end

  test "where initialize save" do
    assert_difference('Category.count') do
      Category.where(full_name: 'root/test').new.save
    end
  end

  test "where create" do
    assert_difference('Category.count') do
      Category.where(full_name: 'root/test').create
    end
  end

end
