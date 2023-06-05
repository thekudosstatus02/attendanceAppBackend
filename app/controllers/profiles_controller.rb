class ProfilesController < ApplicationController
    def list_of
        render json: {list: ProfileRepresenter.list_of}, status: :ok
    end
end