#history输出用户了命令历史；awk统计并输出列表；sort排序；head截出前10行。
#history
history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
