require 'spec_helper'

describe "Hotel" do
  before do
    @hotel = Hotel.new(title: "Hotel", grades_attributes: { value: 5 })
  end

  subject { @hotel }

  it { should respond_to(:title) }
  it { should respond_to(:breakfast_included) }



end
