#!/bin/bash

# Kiểm tra số lượng tham số
if [ $# -lt 2 ]; then
    echo "Error: Both parameters must be specified."
    exit 1
fi

filesdir="$1"
searchstr="$2"

# Kiểm tra xem filesdir có phải là một thư mục không
if [ ! -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a directory."
    exit 1
fi

# Đếm số file trong thư mục và tất cả các thư mục con
file_count=$(find "$filesdir" -type f | wc -l)

# Đếm số dòng chứa searchstr trong các file
line_count=$(grep -r -c "$searchstr" "$filesdir" | awk -F: '{sum += $2} END {print sum}')

# In kết quả
echo "The number of files are $file_count and the number of matching lines are ${line_count:-0}"