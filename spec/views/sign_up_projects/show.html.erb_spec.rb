require 'spec_helper'

describe "sign_up_projects/show" do
  before(:each) do
    @sign_up_project = assign(:sign_up_project, stub_model(SignUpProject))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
