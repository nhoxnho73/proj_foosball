require 'rails_helper'

RSpec.describe MatchesController, type: :controller do
  let (:team_1) { create(:team, :with_users) }
  let (:team_2) { create(:team, :with_users) }

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

  it "creates new record" do
    params = {
      team_1_id: team_1.id,
      team_2_id: team_2.id,
      game_1_score: 1,
      game_2_score: 2,
      game_3_score: 3,
      game_1_winner: 1,
      game_2_winner: 1,
      game_3_winner: 2
    }
    post :create, params: params
    expect(response).to redirect_to :action => :index
    expect(response).to have_http_status(302)
  end

  it "not create new record" do
    params = {
      team_1_id: nil,
      team_2_id: team_2.id,
      game_1_score: 1,
      game_2_score: 2,
      game_3_score: 3,
      game_1_winner: 1,
      game_2_winner: 1,
      game_3_winner: 2
    }
    post :create, params: params
    expect(response).to redirect_to :action => :new
    expect(response).to have_http_status(302)
  end

end
