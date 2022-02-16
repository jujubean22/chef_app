module Api
  class RecipesController < ApplicationController
    def random
      random = Recipe::Client.random

      render json: random
    end
  end
end
