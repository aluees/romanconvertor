def fromRoman(romanNumber)
    
    romanValues = {"M" => 1000,
        "D" => 500,
        "C" => 100,
        "L" => 50,
        "X" => 10,
        "V" => 5,
        "I" => 1}

    arabicNumber = 0
    romanNumberSub = romanNumber.dup

    #substituting for the subtraction pairs
    romanNumberSub.sub! "CM", "DCCCC"
    romanNumberSub.sub! "CD", "CCCC"
    romanNumberSub.sub! "XC", "LXXXX"
    romanNumberSub.sub! "XL", "XXXX"
    romanNumberSub.sub! "IX", "VIIII"
    romanNumberSub.sub! "IV", "IIII"

    for i in 0..romanNumberSub.length-1
        currentLetter = romanNumberSub[i]
        if not "IVXLCDM".include? currentLetter
            raise TypeError
        end
        arabicNumber += romanValues[currentLetter]
    end

    return arabicNumber
end

def toRoman(arabicNumber)

    if arabicNumber < 1 or arabicNumber > 3999
        raise RangeError
    end

    romanLetters = "IVXLCDM"
    romanValues = { "M" => 1000,
        "D" => 500,
        "C" => 100,
        "L" => 50,
        "X" => 10,
        "V" => 5,
        "I" => 1,
    }

    romanNumber = ""
    for i in (romanLetters.length-1).downto(0)
        currentLetter = romanLetters[i]
        value = romanValues[currentLetter]
        romanNumber += currentLetter * (arabicNumber / value)
        arabicNumber = arabicNumber % value
    end

    #substituting back in subtraction pairs
    romanNumber.gsub! "DCCCC", "CM"
    romanNumber.gsub! "CCCC", "CD"
    romanNumber.gsub! "LXXXX", "XC"
    romanNumber.gsub! "XXXX", "XL"
    romanNumber.gsub! "VIIII", "IX"
    romanNumber.gsub! "IIII", "IV"

    return romanNumber
end