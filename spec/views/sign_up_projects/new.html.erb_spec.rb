require 'spec_helper'

describe "sign_up_projects/new" do
  before(:each) do
    assign(:sign_up_project, stub_model(SignUpProject).as_new_record)
  end

  it "renders new sign_up_project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sign_up_projects_path, "post" do
    end
  end
end
