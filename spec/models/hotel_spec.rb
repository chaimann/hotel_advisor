require 'spec_helper'
require 'rails_helper'

describe Hotel do
  let(:user) { FactoryGirl.create(:user) }

  before do
    @hotel = Hotel.new(title: "Hotel")
    @hotel.grades.build(value: 5, user: user)
  end

  subject { @hotel }

  it { should respond_to(:title) }
  it { should respond_to(:breakfast_included) }
  it { should respond_to(:room_description) }
  it { should respond_to(:price) }
  it { should respond_to(:grades) }
  it { should respond_to(:address) }
  it { should respond_to(:rating) }

  it { should be_valid }

  describe "when title is not present" do
    before { @hotel.title = " "}
    it { should_not be_valid }
  end

  describe "when grade is not present" do
    before { @hotel.grades_attributes = { '0' => { value: "" } } }
    it { should_not be_valid }
  end

  describe "when grade is out of the permitted range" do
    before { @hotel.grades_attributes = { '0' => { value: 0 } } }
    it { should_not be_valid }
    before { @hotel.grades_attributes = { '0' => { value: 6 } } }
    it { should_not be_valid}
  end

  describe "when title is too long" do
    before { @hotel.title = "a"*31 }
    it { should_not be_valid }
  end

  describe "when room description is too long" do
    before { @hotel.room_description = "a"*301 }
    it { should_not be_valid }
  end

end
