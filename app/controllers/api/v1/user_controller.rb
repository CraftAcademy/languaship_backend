class Api::V1::UserController < ApiController
  before_action :authenticate_api_v1_user!

  def index
    @users = User.all.sort
    render json: @users
  end

  def show
    @user = User.find_by(id: params[:id])
    render json: @user
  end

  def create
    if profile_params
      current_api_v1_user.name = profile_params[:name]
      current_api_v1_user.age = profile_params[:age]
      current_api_v1_user.gender = profile_params[:gender]
      current_api_v1_user.languages << Language.find_by(name: profile_params[:learnLanguage], native: false, learn: true)
      current_api_v1_user.languages << Language.find_by(name: profile_params[:nativeLanguage], native: true, learn: false)
      Location.create(locale: profile_params[:location], user: current_api_v1_user)
      if current_api_v1_user.save
        current_api_v1_user.save
        render json: {message: 'Success'}
      else
        render json: {message: 'An unexpected error occurred'}
      end
    else
      render json: {message: 'An unexpected error occurred'}
    end
  end

  private

  def profile_params
    params.require(:user_profile).permit!
  end

end
