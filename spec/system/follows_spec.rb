require 'rails_helper'

RSpec.describe "Follows", js: true, type: :system do
  before do
    @user1 = create(:user)
    @user2 = create(:user)
  end


  describe 'フォロー機能' do
    it 'ユーザーをフォロー、フォロー解除できる' do
      # ユーザー１としてログインする
      sign_in @user1
      # ユーザー２の詳細ページへ移動する
      visit user_path(@user2)
      puts "Navigated to user_path: #{user_path(@user2)}"
      puts "Page body: #{page.body}"
      expect(page).to have_http_status(200), 'アクセスに失敗しています'


      #ユーザー２をフォローする
      click_on('follow_btn')
      # ユーザー１がユーザー２をフォローしているか確認
      expect(page).to have_selector '.unfollow_btn', text: 'フォロー解除'
      expect(@user1.followings.count).to eq(1)
      expect(@user2.followeds.count).to eq(1)
      #ユーザー２をフォロー解除する
      click_on('unfollow_btn')
      expect(page).to have_selector '.follow_btn', text: 'フォロー'
      expect(@user1.followings.count).to eq(0)
      expect(@user2.followeds.count).to eq(0)
    end
  end
end
