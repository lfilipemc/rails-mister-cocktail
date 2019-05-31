class DosesController < ApplicationController
  def new
    @cocktail = set_doses
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = set_doses
    if @dose.save
      redirect_to cocktail_path(set_doses)
    else
      render :new
    end
  end

  def destroy
    @cocktail = Dose.find(params[:id]).cocktail
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def set_doses
    Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
