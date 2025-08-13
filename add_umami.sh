#!/bin/bash

# 查找所有HTML文件
find . -name "*.html" | while read file; do
  echo "处理文件: $file"
  
  # 检查文件是否已经包含umami脚本
  if grep -q "umami.sdcom.top/script.js" "$file"; then
    echo "  文件已包含umami脚本，跳过"
    continue
  fi
  
  # 在</head>标签前添加umami脚本
  sed -i '' 's|</head>|<script defer src="https://umami.sdcom.top/script.js" data-website-id="616f60de-8962-40c4-ae69-d46067433da8"></script>\n</head>|' "$file"
  echo "  已添加umami脚本"
done

echo "完成！"