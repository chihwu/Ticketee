require 'rails_helper'

# for the things users can do, but not should do, use the RSpec controller test rather than a feature test
RSpec.describe ProjectsController, type: :controller do
	it "handles a missing project correctly" do
		get :show, id: "not-here" # make a GET request to the show action in the ProjectsController with the passed-in id being "not-here"

		expect(response).to redirect_to(projects_path)

		message = "The project you were looking for could not be found."
		expect(flash[:alert]).to eq message
	end
end
