require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /tasks" do
    it "works!" do
      get tasks_path
      expect(response).to have_http_status(302)
    end
  end
end
