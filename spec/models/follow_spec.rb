require 'rails_helper'
format documentation

RSpec.describe Follow, type: :model do
	let(:user) { create(:user) }
	let(:other_user) { create(:user) }

  describe "フォローについて" do
	  it "ユーザーをフォローできること" do
      # aがbをフォローしていないことを確認する
	    expect(user.following?(other_user)).to be_falsey
      # aがbをフォローする
      user.follow(other_user)
      # aが適切にbをフォローできていることをテストする
      expect(user.following?(other_user)).to be_truthy
    end

    it "フォローしているユーザーをフォロー解除できること" do
	    user.follow(other_user)
	    # aがbをフォローしていることを確認する
	    expect(user.following?(other_user)).to be_truthy
      # aがbのフォローを解除する
	    user.unfollow(other_user)
      # aがbをフォローしていない状態になったことをテストする
	    expect(user.following?(other_user)).to be_falsey
    end

    it "同じユーザーを重複してフォローできないこと" do
      # aがbをフォローしていることを確認する
      user.follow(other_user)
      # aがbをフォローしようとした時にバリデーションエラーが出ることを確認
      expect { user.follow(other_user) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "自分自身をフォローできないこと" do
      # aが自分をフォローしようとした時にエラーが出ることを確認
      expect { user.follow(user) }.to raise_error(AcriveRecord::RecordInvalid)
    end
  end
end
