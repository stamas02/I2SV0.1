class TestController < ApplicationController
  include ImageToText;
  def index

  end
  def create



    received_img = params[:fileToUpload];

    blob = received_img.read;

    #convertImageToText(blob);

    render :text =>   convertImageToText(blob);
  end


end