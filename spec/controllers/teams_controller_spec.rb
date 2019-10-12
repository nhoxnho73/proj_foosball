require 'rails_helper'

RSpec.describe TeamsController, type: :controller do
  it "index" do
    get :index
    expect(response).to render_template("index")
    expect(response).to have_http_status(200)
  end

  it "new" do
    get :new
    expect(response).to render_template("new")
    expect(response).to have_http_status(200)
  end

  let (:user) { create(:user) }
  it "creates new" do
    params = {
      user_id: [user.id],
      team: {
        name: 'name'
      }
    }
    post :create, params: params
    expect(response).to redirect_to :action => :index
    expect(response).to have_http_status(302)
  end

  it "not create new" do
    params = {
      user_id: ['',''],
      team: {
        name: 'name'
      }
    }
    post :create, params: params
    expect(response).to redirect_to :action => :new
    expect(response).to have_http_status(302)
  end
end
