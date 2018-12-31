defmodule IExHelpers do
  def type(term) when is_nil(term), do: "Type: Nil"
  def type(term) when is_binary(term), do: "Type: Binary"
  def type(term) when is_boolean(term), do: "Type: Boolean"
  def type(term) when is_atom(term), do: "Type: Atom"
  def type(term) when is_integer(term), do: "Type: Integer"
  def type(term) when is_float(term), do: "Type: Float"
  def type(term) when is_function(term), do: "Type: Function"
  def type(term) when is_list(term), do: "Type: List"
  def type(term) when is_map(term), do: "Type: Map"
  def type(term) when is_tuple(term), do: "Type: Tuple"
  def type(_term), do: "Type: Unknown"
end

