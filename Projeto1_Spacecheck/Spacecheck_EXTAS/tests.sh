#!/bin/bash

#!/bin/bash

# Test Case 1: Valid input, no flags
echo "Test Case 1: Valid input, no flags"
./spacecheck.sh test_a1/    # Should display all directories and subdirectories with their respective sizes

# Test Case 2: Test -n flag
echo -e "----------------------------------------\n"
echo "Test Case 2: Test -n flag"
./spacecheck.sh -n "*.txt" test_a1  # Should display all directories and subdirectories with their respective sizes, considering only the size of files with .txt extension

# Test Case 3: Test -d flag
echo -e "----------------------------------------\n"
echo "Test Case 3: Test -d flag"

# Valid date input:
echo "--------------------"
echo "Valid date input:"
# Test the script with a valid date in different formats. The output should be the same for all the commands below (Dirs and respective Size)
./spacecheck.sh -d "2023-011-10 10:00" test_a1/ 
./spacecheck.sh -d "Nov 10 10:00" test_a1/
./spacecheck.sh -d "2023-011-10" test_a1/

# Invalid date input:
echo "--------------------"
echo "Invalid date input:"
# Test the script with examples of invalid dates. The output should be: "-d Argument [argument] is invalid.", followed by the Usage message. 
./spacecheck.sh -d "invalid_date" test_a1/          
./spacecheck.sh -d "2010-50-02" test_a1/   
./spacecheck.sh -d "2010-02-100" test_a1/
./spacecheck.sh -d "" test_a1/
./spacecheck.sh -d "2010-50-02 92:00:00" test_a1/

# Test the script with a date set before the given dir was created
echo "--------------------"
echo "Date set before the given dir was created:"
./spacecheck.sh -d "1970-01-01" test_a1/    #All dirs and subdirs of the argument should be displayed with SIZE = 0.


# Test Case 4: Test -s flag
echo "Test Case 4: Test -s flag"
./spacecheck.sh -s 100 test_a1/

# Test Case 5: Test -r flag
echo "Test Case 5: Test -r flag"
./spacecheck.sh -r test_a1/

# Test Case 6: Test -a flag
echo "Test Case 6: Test -a flag"
./spacecheck.sh -a test_a1/

# Test Case 7: Test -l flag
echo "Test Case 7: Test -l flag"
./spacecheck.sh -l 5 test_a1/

# Test Case 8: Invalid input for -n flag
echo "Test Case 8: Invalid input for -n flag"
./spacecheck.sh -n "invalid_pattern" test_a1/

# Test Case 9: Invalid input for -d flag
echo "Test Case 9: Invalid input for -d flag"
./spacecheck.sh -d "invalid_date" test_a1/

# Test Case 10: Invalid input for -s flag
echo "Test Case 10: Invalid input for -s flag"
./spacecheck.sh -s -100 test_a1/

# Test Case 11: Invalid input for -l flag
echo "Test Case 11: Invalid input for -l flag"
./spacecheck.sh -l -5 test_a1/

# Test Case 12: Test combination of flags (-n, -s, -d)
echo "Test Case 12: Test combination of flags (-n, -s, -d)"
./spacecheck.sh -n "*.txt" -s 50 -d "2022-01-01" test_a1/

# Test Case 13: Test combination of flags (-r, -a, -l)
echo "Test Case 13: Test combination of flags (-r, -a, -l)"
./spacecheck.sh -r -a -l 3 test_a1/

# Test Case 14: Test with multiple directories
echo "Test Case 14: Test with multiple directories"
./spacecheck.sh test_a1/1 test_a1/2

# Test Case 15: Test with a non-existent directory
echo "Test Case 15: Test with a non-existent directory"
./spacecheck.sh /path/to/nonexistent/directory

# Test Case 16: Test with no arguments (should display an error message)
echo "Test Case 16: Test with no arguments (should display an error message)"
./spacecheck.sh

echo "Testing complete"

