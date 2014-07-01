require 'spec_helper'

describe "SignUpProjects" do
  describe "GET /sign_up_projects" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get sign_up_projects_path
      response.status.should be(200)
    end
  end
end
