class UsersController < ApplicationController
  before_filter :require_login, :except => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.role = "inactive"
    @user.activated = false
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render :new
    end
  end

  def edit
    if current_user.role == 'admin'
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  def update
    if current_user.role == 'admin'
      @user = User.find(params[:id])
    else
      @user = current_user
    end
    if @user.update_attributes(params[:user])
      redirect_to dashboard_url, :notice  => "Profil von #{@user.username} aktualisiert."
    else
      render :action => 'edit'
    end

  end


end
