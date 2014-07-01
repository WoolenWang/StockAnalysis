require 'spec_helper'

describe "sign_up_projects/index" do
  before(:each) do
    assign(:sign_up_projects, [
      stub_model(SignUpProject),
      stub_model(SignUpProject)
    ])
  end

  it "renders a list of sign_up_projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
