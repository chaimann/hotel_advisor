require 'spec_helper'
require 'rails_helper'

describe Comment do

  let(:user) { FactoryGirl.create(:user) }
  let(:hotel) { FactoryGirl.create(:hotel) }

  before { @grade = user.grades.build(value: 5, hotel: hotel) }

  before { @comment = user.comments.create!(content: "Lorem ipsum", hotel: hotel, grade: @grade) }

  subject { @comment }

  it { should respond_to :content }
  it { should respond_to :grade }
  it { should respond_to :user_id }
  it { should respond_to :hotel_id }
  it { should respond_to :user }
  it { should respond_to :hotel }

  it { should be_valid }

  describe "when content is empty" do
    before { @comment.content = "" }
    it { should_not be_valid }
  end

  describe "when content is too long" do
    before { @comment.content = "a"*141 }
    it { should_not be_valid }
  end

  describe "when grade is not present" do
    before { @comment.grade = nil }
    it { should_not be_valid }
  end

  describe "when user_id is not present" do
    before { @comment.user_id = ""}
    it { should be_valid }
  end

  describe "when hotel_id is not present" do
    before { @comment.hotel_id = "" }
    it { should_not be_valid }
  end

end