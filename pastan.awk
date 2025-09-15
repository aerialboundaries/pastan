{ sub(/\r$/, "")  # Delete windows CR
  if ($0 ~ /^[[:space:]]*$/) next

  if ($0 ~ /^[0-9]{4}$/) {
    word_number = $0
    flag = 1  
    printf("\n")
    print word_number
    next
  }

  if (flag == 1) {
    word = $0
    print word
    flag = 2
    next
  }

  if (flag == 2) {
    pronounce = $0
    print pronounce
    flag = 3
    next
  }

  if (flag == 3 && $0 !~ /^[0-9]{4}$/) {
    imi = $0
    print imi
  }
}
