module AuthenticationHelpers
  def sign_in(user)
    expect(controller).to receive(:current_user).and_return(user)
    # expect(controller).to receive(:user_id).anf_return(user.id)
  end
end
