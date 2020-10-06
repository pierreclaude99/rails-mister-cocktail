class DosesController < ApplicationController
  def new
    @dose = Dose.new
  end

    def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(param_dose)
    @dose.cocktail = @cocktail
    if @dose.save!
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end

  end
  private
  def param_dose
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
