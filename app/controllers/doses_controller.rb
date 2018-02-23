class DosesController < ApplicationController
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    if @dose.save!
      redirect_to dose_path(@dose)
    else
      render :edit
    end
  end

  def edit
    @dose = Dose.find(params[:id])
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to doses_path
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
