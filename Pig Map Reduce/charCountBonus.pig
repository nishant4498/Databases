lines = load './in/*.txt' as (line:chararray);
words = foreach lines generate flatten(TOKENIZE(LOWER(line))) as word;
letters = foreach words generate flatten(TOKENIZE(REPLACE(word,'','|'), '|')) as letter;
vowel_letters = FILTER letters BY (letter == 'a') OR (letter == 'e') OR (letter == 'i') OR (letter == 'o') OR(letter == 'u');
grouped = group vowel_letters by letter;
lettercount = foreach grouped generate group, COUNT(vowel_letters);
store lettercount into './in/charcountbonus';
