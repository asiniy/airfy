defmodule Airfy.EncryptorTest do
  use ExUnit.Case
  import Airfy.Encryptor

  @key "some key"
  @data "some data"

  test "returns encrypted string" do
    assert encrypt(@key, @data) == 2725994554441139969
  end
end
