require 'spec_helper'

describe "sign_up_projects/edit" do
  before(:each) do
    @sign_up_project = assign(:sign_up_project, stub_model(SignUpProject))
  end

  it "renders the edit sign_up_project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sign_up_project_path(@sign_up_project), "post" do
    end
  end
end
