class ProfilesController < ApplicationController
  # GET to /users/:user_id/profile/new
  def new
    @profile = Profile.new
  end
  
  # POST to /users/:user_id/profile
  def create
    # Ensure that we have the user who is filling out form
    @user = User.find(params[:user_id])
    # Create profile linked to this specific user
    @profile = @user.build_profile(profile_params)
    if @profile.save
      flash[:notice] = "Profile created!"
      redirect_to user_path(id: params[:user_id])
    else
      render 'new'
    end
  end
  
  # GET to /users/:user_id/profile/edit
  def edit
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end
  
  # PATCH to /users/:user_id/profile
  def update
    # Retreive the user from the database
    @user = User.find(params[:user_id])
    # Retrieve the user's profile
    @profile = @user.profile
    # Mass assign edited profile attributes and save (update)
    if @profile.update_attributes(profile_params)
      flash[:notice] = "Profile updated!"
      # Redirect user to their profile page
      redirect_to user_path(id: params[:user_id])
    else
      render 'edit'
    end
  end
  
  private
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description)
    end

end