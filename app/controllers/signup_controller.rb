class SignupController < ApplicationController
  def 
    @user = User.new
    binding.pry
  end

  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password, 
      :password_confirmation, 
      profile_attributes: [:id, :family_name_kanji, :first_name_kanji, :family_name_kana, :first_name_kana, :birth_day]
    )
  end
end  