require 'spec_helper'
require 'rails_helper'

describe Grade do
  let(:user) { FactoryGirl.create(:user) }
  let(:hotel) { FactoryGirl.create(:hotel) }
  before { @grade = user.grades.build(value: 5, hotel: hotel, comment_attributes: 
                                     { content: "Lorem ipsum", hotel: hotel }) }

  subject { @grade }

  it { should respond_to(:value) }
  it { should respond_to(:user) }
  it { should respond_to(:hotel) }
  it { should respond_to(:comment) }
  it { should respond_to(:user_id) }
  it { should respond_to(:hotel_id) }
  its(:user) { should eq user }
  its(:hotel) { should eq hotel }

  it { should be_valid }

  describe "when value is not present" do
    before { @grade.value = "" }
    it { should_not be_valid }
  end

  describe "when value is out of permitted bounds" do
    before { @grade.value = 0 }
    it { should_not be_valid }
    before { @grade.value = 6 }
    it { should_not be_valid }
  end

  describe "when user_id is not present" do
    before { @grade.user_id = "" }
    it { should_not be_valid }
  end

  describe "when hotel_id is not present" do
    before { @grade.hotel_id = "" }
    it { should_not be_valid }
  end

  describe "when hotel is not present" do
    before { @grade.hotel = nil }
    it { should_not be_valid }
  end

  describe "when user is not present" do
    before { @grade.user = nil }
    it { should_not be_valid }
  end

  it "when user tries to add grade to the same hotel" do
    @grade = user.grades.create!(value: 5, hotel: hotel, comment_attributes: 
                                    { content: "Lorem ipsum", hotel: hotel } )
    expect do 
      @second_grade = user.grades.create(value: 5, hotel: hotel, comment_attributes: 
                                         { content: "Lorem ipsum", hotel: hotel } )
    end.not_to change(Grade, :count)
  end

  it "when comment is not present" do
    expect { @grade = user.grades.create!(value: 5, hotel: hotel).not_to change(Grade, :count) }
  end

end