class PresentersController < ApplicationController
  def show
    @presenter = Presenter.find(params[:id])
  end

  def new
    if current_user.registered?
      current_user.update!(is_presenter: true)
      flash[:success] = "Success! You are now registered as a volunteer presenter!"
      redirect_to root_path
    end
  end

  def create
    @presenter = Presenter.new(presenter_params)

    @presenter.save!
    flash[:success] = "Created presenter!"
    redirect_to root_path
  end

private
  def presenter_params
    params.require(:presenter).permit(:name, :organization, :postal_address, :phone, :email)
  end
end
