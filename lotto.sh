#!/bin/bash

echo ""

echo "Ez a processz a sporolas mindennapi problemajara kinal megoldast."
echo "Tobbe nem kell feleslegesen kidobni a penzunket lottoszelvenyekre!"
echo "Helyette ingyen is szerencset probalhatunk!"
echo "Igy ugyanugy nem nyerunk semmit, mint ha szelvenyt vennenk, ugyanakkor nem is bukunk!"

CV=0
CV2=0
RND=0
TALALATDB=0
SORSZAM=1
declare -a tippek;
declare -a sorsolas;
declare -a talalatok;

echo ""
echo "Kerjuk, adja meg a tippjeit:"
while [[ $CV -lt 5 ]]
do
  read -p "Szam "$SORSZAM": " TIPP
  while [[  $CV2 -lt $CV  || $TIPP -lt 1 || $TIPP -gt 90 ]]
  do
    if [[ $TIPP == "${tippek[CV2]}" || $TIPP -lt 1 || $TIPP -gt 90 ]]
    then
      echo "A tipp nem megfelelo, mert vagy kisebb mint 1, vagy nagyobb mint 90, vagy mar volt ilyen tipp!"
      echo "Adjon meg masik szamot:"
      read -p "Szam "$SORSZAM": " TIPP
    else
      ((CV2 = CV2 + 1))
    fi
  done
    ((tippek[CV]=TIPP));
    ((CV2=0))
    ((CV = CV + 1))
    ((SORSZAM = SORSZAM + 1))
done

((CV=0))

echo ""
echo "Nyero szamok:"
while [[ $CV -lt 5 ]]
do
  ((RND = $RANDOM % 90 + 1))
  while [[ $CV2 -lt $CV ]]
  do
    if [[ $RND == "${sorsolas[CV2]}" ]]
    then
      ((RND = $RANDOM % 90 + 1))
    else
      ((CV2 = CV2 + 1))
    fi
  done
    ((CV2 = 0))
    ((sorsolas[CV]=RND));
    echo "${sorsolas[CV]}"
    ((CV = CV + 1))
done

((CV=0))
((CV2=0))

echo ""
echo "Talalatok:"
while [[ $CV -lt 5 ]]
do
  while [[ $CV2 -lt 5 ]]
    do
    if [ "${tippek[CV]}" -eq "${sorsolas[CV2]}" ]
    then
      echo "${tippek[CV]}"
      ((TALALATDB = TALALATDB + 1))
    fi
    ((CV2 = CV2 + 1))
  done
  ((CV2 = 0))
  ((CV = CV + 1))
done

echo ""
echo "Gratulalunk!"

case "$TALALATDB" in
1)
  echo "Onnek van egy talalata."
  ;;
2)
  echo "Onnek kettes talalata van!"
  ;;
3)
  echo "Harmas talalat!"
  ;;
4)
  echo "Negyes talalat! Ez igen!"
  ;;
5)
  echo "Ez ugy se fog lefutni soha."
  ;;
*)
  echo "Ahogy az valoszinusitheto volt: Onnek egy talalata sincs."
  ;;
esac

echo ""