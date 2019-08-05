defmodule Test do
  def permission(oki) do
    case oki do
    person = %{age: age} when is_number(age) and age >= 21
      -> IO.puts "clear to enter, #{person.name}"
    _ -> IO.puts "no"
    end
  end
end

oki = %{name: "Oki", likes: "Kupi", age: 21}
Test.permission(oki)
