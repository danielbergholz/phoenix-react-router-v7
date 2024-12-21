defmodule Threadit.Users do
  import Ecto.Query, warn: false

  alias Threadit.Repo
  alias Threadit.Users.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  def get_user_by_username(username) do
    Repo.get_by(User, username: username)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Gets a single user by username.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user_by_username!("username")
      %User{}

      iex> get_user_by_username!("bad_username")
      ** (Ecto.NoResultsError)

  """
  def get_user_by_username!(username), do: Repo.get_by!(User, username: username)

  ## User registration

  @doc """
  Registers a user.

  ## Examples

      iex> register_user(%{field: value})
      {:ok, %User{}}

      iex> register_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def register_user(attrs) do
    %User{}
    |> User.registration_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Deletes a user by username. If the user does not exist, raises `Ecto.NoResultsError`.

  ## Examples

      iex> delete_user_by_username("username")
      {:ok, %User{}}

      iex> delete_user_by_username("bad_username")
      ** (Ecto.NoResultsError)

  """
  def delete_user_by_username(username) do
    user = get_user_by_username!(username)
    delete_user(user)
  end
end
