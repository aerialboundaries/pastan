NR < 889 || NR > 60097 {next}

{
sub(/\r$/, "")  # Delete CR
}

/^[[:space:]]*$/ {next} # Skip blank line

/^[0-9]{4}$/ {
  if (imi != "") print imi  # print accumulated imi
  imi = ""  # Initialize imi
  word_number = $0
  flag = 1
  printf("\n%s\n", word_number)
  next
}

flag == 1 {
  word = $0
  print word
  flag = 2
  next
}

flag == 2 {
  pronounce = $0
  print pronounce
  flag = 3
  next
}

flag == 3 {
  imi = imi " " $0
}

END {
  if (imi != "") print imi
}
