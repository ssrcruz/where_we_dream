require 'test_helper'
require 'minitest/pride'

class SchoolTest < ActiveSupport::TestCase
  test "name" do
    school = School.new(name: 'name')
    assert school.save
  end

  test "link" do
    school = School.new(name: 'name', link: 'link')
    assert school.save
  end

  test "students" do
    school1 = School.new(name: 'name', students: 'seven')
    school2 = School.new(name: 'name', students: 10)
    refute school1.save
    assert school2.save
  end

  test "undocumented_students" do
    school1 = School.new(name: 'name', undocumented_students: 'seven')
    school2 = School.new(name: 'name', undocumented_students: 10)
    refute school1.save
    assert school2.save
  end

  test "street" do
    school = School.new(name: 'name', street: 'street')
    school.save
  end

  test "city" do
    school = School.new(name: 'name', city: 'city')
    school.save
  end

  test "state" do
    school = School.new(name: 'name', state: 'state')
    school.save
  end

  test "zip" do
    school1 = School.new(name: 'name', zip: '1234')
    school2 = School.new(name: 'name', zip: '12345')
    school3 = School.new(name: 'name', zip: '123456')
    refute school1.save
    assert school2.save
    refute school3.save
  end

  test "public" do
    school = School.new(name: 'name', public: true)
    assert school.save
  end

  test "address" do
    school1 = School.create(name: 'name', street: "one", city: "two", state: "three", zip: "39902")
    school2 = School.create(name: 'name', street: "one", city: "two", state: "three")
    assert_equal 'one, two, three 39902', school1.address
    assert_equal nil, school2.address
  end
end
