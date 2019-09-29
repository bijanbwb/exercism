defmodule RomanNumeralsTest do
  use ExUnit.Case

  test "1" do
    assert RomanNumerals.numeral(1) == "I"
  end

  test "2" do
    assert RomanNumerals.numeral(2) == "II"
  end

  test "3" do
    assert RomanNumerals.numeral(3) == "III"
  end

  test "4" do
    assert RomanNumerals.numeral(4) == "IV"
  end

  test "5" do
    assert RomanNumerals.numeral(5) == "V"
  end

  test "6" do
    assert RomanNumerals.numeral(6) == "VI"
  end

  test "7" do
    assert RomanNumerals.numeral(7) == "VII"
  end

  test "8" do
    assert RomanNumerals.numeral(8) == "VIII"
  end

  test "9" do
    assert RomanNumerals.numeral(9) == "IX"
  end

  test "10" do
    assert RomanNumerals.numeral(10) == "X"
  end

  test "11" do
    assert RomanNumerals.numeral(11) == "XI"
  end

  test "14" do
    assert RomanNumerals.numeral(14) == "XIV"
  end

  test "15" do
    assert RomanNumerals.numeral(15) == "XV"
  end

  test "18" do
    assert RomanNumerals.numeral(18) == "XVIII"
  end

  test "19" do
    assert RomanNumerals.numeral(19) == "XIX"
  end

  test "20" do
    assert RomanNumerals.numeral(20) == "XX"
  end

  test "27" do
    assert RomanNumerals.numeral(27) == "XXVII"
  end

  test "30" do
    assert RomanNumerals.numeral(30) == "XXX"
  end

  test "48" do
    assert RomanNumerals.numeral(48) == "XLVIII"
  end

  test "50" do
    assert RomanNumerals.numeral(50) == "L"
  end

  test "59" do
    assert RomanNumerals.numeral(59) == "LIX"
  end

  test "80" do
    assert RomanNumerals.numeral(80) == "LXXX"
  end

  test "90" do
    assert RomanNumerals.numeral(90) == "XC"
  end

  @tag :pending
  test "93" do
    assert RomanNumerals.numeral(93) == "XCIII"
  end

  test "100" do
    assert RomanNumerals.numeral(100) == "C"
  end

  @tag :pending
  test "141" do
    assert RomanNumerals.numeral(141) == "CXLI"
  end

  @tag :pending
  test "163" do
    assert RomanNumerals.numeral(163) == "CLXIII"
  end

  @tag :pending
  test "402" do
    assert RomanNumerals.numeral(402) == "CDII"
  end

  @tag :pending
  test "575" do
    assert RomanNumerals.numeral(575) == "DLXXV"
  end

  @tag :pending
  test "911" do
    assert RomanNumerals.numeral(911) == "CMXI"
  end

  @tag :pending
  test "1024" do
    assert RomanNumerals.numeral(1024) == "MXXIV"
  end

  @tag :pending
  test "3000" do
    assert RomanNumerals.numeral(3000) == "MMM"
  end
end
