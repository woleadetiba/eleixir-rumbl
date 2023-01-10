defmodule Rumbl.Accounts do

  import Ecto.Query, warn: false
  alias Rumbl.Repo
  alias Rumbl.Accounts.User

  def list_users do
    # [
    #   %User{id: "1", name: "José", username: "josevalim"},
    #   %User{id: "2", name: "Bruce", username: "redrapids"},
    #   %User{id: "3", name: "Chris", username: "chrismccord"}
    # ]
    Repo.all(User)
  end

  def get_user(id) do
    # Enum.find(list_users(), fn user -> user.id == id end )
    Repo.get(User, id)
  end

  def get_user_by(params) do
    # Enum.find(list_users(), fn user ->
    #    Enum.all?(params, fn{key, val} -> Map.get(user, key) == val end)
    # end)
    Repo.get_by(User, params)
  end

  def get_user!(id) do
    Repo.get!(User, id)
  end

  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end

  """
  def get_uer(id), do: Repo.get!(User, id)

  @doc """
  Creates a User.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_delete(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end
end
