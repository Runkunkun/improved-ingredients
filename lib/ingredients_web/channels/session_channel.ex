defmodule IngredientsWeb.SessionChannel do
  use IngredientsWeb, :channel

  def join("session:" <> session, _params, socket) do
    socket    = assign(socket, :session, session)
    response  = %{session: session}
    {:ok, response, socket}
  end
end
