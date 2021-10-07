class Api::V1::PrivateController < ApplicationController
  before_action :authenticate_user!
end
