#!/bin/bash

# Kiểm tra số lượng tham số
if [ $# -lt 2 ]; then
    echo "Error: Both parameters must be specified."
    exit 1
fi

writefile="$1"
writestr="$2"

# Tạo thư mục chứa file nếu chưa tồn tại
mkdir -p "$(dirname "$writefile")"

# Kiểm tra xem writefile có phải là một thư mục không
if [ -d "$writefile" ]; then
    echo "Error: '$writefile' is a directory."
    exit 1
fi

# Tạo file và ghi nội dung vào file đó
echo "$writestr" > "$writefile"

# Kiểm tra xem file có được tạo thành công không
if [ $? -ne 0 ]; then
    echo "Error: Could not create or write to '$writefile'."
    exit 1
fi

echo "File '$writefile' created successfully with content."