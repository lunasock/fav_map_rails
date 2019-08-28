require 'rails_helper'
RSpec.describe SpotsController, type: :controller do
  describe '新規投稿ページ' do
    context "新規投稿ページが正しく表示される" do
      before do
        get :index
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end

      render_views
      it 'タイトルが正しく表示されていること' do
      expect(response.body).to include("ようこそ")
      end
    end
  end
end

