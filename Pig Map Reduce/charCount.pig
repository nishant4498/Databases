lines = load './in/*.txt' as (line:chararray);
words = foreach lines generate flatten(TOKENIZE(LOWER(line))) as word;
letters = foreach words generate flatten(TOKENIZE(REPLACE(word,'','|'), '|')) as letter;
grouped = group letters by letter;
lettercount = foreach grouped generate group, COUNT(letters);
store lettercount into './in/charcount';
