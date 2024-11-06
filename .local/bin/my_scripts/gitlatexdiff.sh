#!/bin/sh


gitlatexdiff() {
    # Show help if -h or --help is used
    if [[ "$1" == "-h" || "$1" == "--help" ]]; then
        echo "Usage: gitlatexdiff <name_branch1> <file_branch1> <name_branch2> <file_branch2> [output_file]"
        echo "Compares two versions of LaTeX files from different Git branches using latexdiff."
        echo
        echo "Arguments:"
        echo "  name_branch1   Name of the first branch for the comparison"
        echo "  file_branch1   Path to the file in the first branch"
        echo "  name_branch2   Name of the second branch for the comparison"
        echo "  file_branch2   Path to the file in the second branch"
        echo "  output_file    (Optional) Name of the output file for latexdiff. Defaults to 'document_diff.tex'"
        return 0
    fi

    # Argument check
    if [[ $# -lt 4 ]]; then
        echo "Error: At least four arguments are required."
        echo "Use -h or --help to see the help."
        return 1
    fi

    # Assign variables
    local branch1="$1"
    local file1="$2"
    local branch2="$3"
    local file2="$4"
    local output_file="${5:-document_diff.tex}"

    # Temporary files
    local temp_file1="$(mktemp)"
    local temp_file2="$(mktemp)"

    # Extract files from each branch
    git show "${branch1}:${file1}" > "$temp_file1"
    git show "${branch2}:${file2}" > "$temp_file2"

    # Check if the temporary files are not empty
    if [[ ! -s "$temp_file1" || ! -s "$temp_file2" ]]; then
        echo "Error: One of the extracted files is empty or does not exist in the specified branch."
        rm -f "$temp_file1" "$temp_file2"
        return 1
    fi

    # Run latexdiff
    latexdiff "$temp_file1" "$temp_file2" > "$output_file"

    # Compile the LaTeX file to PDF
    pdflatex "$output_file"

    # Clean up temporary files
    rm -f "$temp_file1" "$temp_file2"

    echo "Differences generated in: $output_file"
}
