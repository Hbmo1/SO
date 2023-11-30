#include <stdio.h>

#define YES 1
#define NO 0

int main() {
    
    int i, j, c, inword, wordlen, wordlenArray[100], wordlenindex;


    printf("Enter text (Ctrl+D to end input):\n");

    wordlen = 0;
    wordlenindex = 0;
    inword = NO;
    while ((c = getchar()) != EOF) {
        // if c is a type of whitespace:
        if ((c == ' ' || c == '\n' || c == '\t')) {
            // if we were inside a word, the word has ended,
            if (inword == YES) {
                wordlenArray[wordlenindex] = wordlen; // so we store the length of that word inside our array, with closest available index,
                inword = NO; 
                ++wordlenindex;                       // and then increment said index by one (so it points to an available spot in the array)
                wordlen = 0;                          // reset wordlen
            }   // if not, then the whitespace is not important.

            // if we have a non-whitespace character and we aren't inside a word:
        } else if (inword == NO) {
            inword = YES;   // it means we are now inside a word,
            wordlen = 1;    // and it's size is now 1 (only contains 1 char, for now).

            // if we have a non-whitespace character and we are inside a word:
        } else {
            ++wordlen;      // it's size gets bigger by 1.
        }
    }

    // iterator variable 'i' that is incremented by 1 until it reaches the index of the last stored value
    for (i = 0; i < wordlenindex; ++i) {
        printf("%2d | ", wordlenArray[i]);          // prints the word length and |
        for ( j = 0; j < wordlenArray[i]; ++j) {
            printf("*");                            // prints a number o "*" equal to the word length
        }
        printf("\n");
    }

    return 0;
}