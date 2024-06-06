require 'rails_helper'

RSpec.describe "Follows", type: :system do
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
      #ユーザー２をフォローする

      #ユーザー２をフォロー解除する
    end
  end
end
