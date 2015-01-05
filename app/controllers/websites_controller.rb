class WebsitesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @website = Website.new
  end

  def create
    @website = Website.new(websites_params)
    @website.user_id = current_user.id
    if @website.save
      flash[:notice] = 'Website was created successfully.'
      redirect_to websites_path
    else
      flash[:error] = 'There was an error while creating a website.'
      render :new
    end
  end

  def edit
    @website = Website.find(params[:id])
  end

  def update
    website = Website.find(params[:id])
    if website.update_attributes(websites_params)
      flash[:notice] = 'Website was saved successfully.'
      redirect_to websites_path
    else
      flash[:error] = 'There was an error while saving the website.'
      render :update
    end
  end

  def destroy
    website = Website.find(params[:id])
    website.destroy
    flash[:notice] = 'The website was deleted successfully.'
    redirect_to websites_path
  end

  private

  def websites_params
    params.require(:website).permit(:address, :name, :description, :verified)
  end
end
