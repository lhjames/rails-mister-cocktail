class DosesController < ApplicationController

  def index
    @doses = Dose.all
  end

  def show
    @doses = Dose.all
    @dose = Dose.find(params[:id])
  end

  def new
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def update
    @dose.update(dose_params)
    redirect_to dose_path(@dose)
  end

  def destroy
    set_dose
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
