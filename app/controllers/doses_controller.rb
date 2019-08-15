class DosesController < ApplicationController
  before_action :find_cocktail, only: [ :new, :create ]
  def new
    # @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    # @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    @dose.save

    redirect_to cocktails_path
  end

  def destroy
    @dose = Dose.find(params[:id])
    # to not loose the cocktail path when destroying dose:
    @cocktail = @dose.cocktail
    @dose.destroy

    redirect_to cocktail_path
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
