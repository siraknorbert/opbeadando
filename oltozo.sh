#!/bin/bash

echo ""

echo "On is unja mar, hogy nem tudja eldonteni reggelente, mit vegyen fel aznapra?"
echo "Tobbe nem kell e-miatt aggodnia! Ez a processz majd segit eldonteni!"
echo "Adja meg alabb a kedvenc ruhait (4 kategoriaban 3-3 ruhadarabot)!"

echo ""

CV=0
SORSZAM=1
SWITCH=0
ISMETLES=1
declare -A polok;
declare -A nadragok;
declare -A cipok;
declare -A egyebek;

echo "Kedvenc polok, ingek, hasonlok:"
while [[ $CV -lt 3 ]]
do
  if [[ $CV -eq 0 ]]
  then
    read -p ""$SORSZAM". ruhadarab: " polok[egy]
  elif [[ $CV -eq 1 ]]
  then
    read -p ""$SORSZAM". ruhadarab: " polok[ketto]
  else
    read -p ""$SORSZAM". ruhadarab: " polok[harom]
  fi
  ((CV=CV+1))
  ((SORSZAM=SORSZAM+1))
done

((CV=0))
((SORSZAM=1))

echo ""
echo "Kedvenc nadragok, szoknyak, hasonlok:"
while [[ $CV -lt 3 ]]
do
  if [[ $CV -eq 0 ]]
  then
    read -p ""$SORSZAM". ruhadarab: " nadragok[egy]
  elif [[ $CV -eq 1 ]]
  then
    read -p ""$SORSZAM". ruhadarab: " nadragok[ketto]
  else
    read -p ""$SORSZAM". ruhadarab: " nadragok[harom]
  fi
  ((CV=CV+1))
  ((SORSZAM=SORSZAM+1))
done

((CV=0))
((SORSZAM=1))

echo ""
echo "Kedvenc labbelik:"
while [[ $CV -lt 3 ]]
do
  if [[ $CV -eq 0 ]]
  then
    read -p ""$SORSZAM". ruhadarab: " cipok[egy]
  elif [[ $CV -eq 1 ]]
  then
    read -p ""$SORSZAM". ruhadarab: " cipok[ketto]
  else
    read -p ""$SORSZAM". ruhadarab: " cipok[harom]
  fi
  ((CV=CV+1))
  ((SORSZAM=SORSZAM+1))
done

((CV=0))
((SORSZAM=1))

echo ""
echo "Kedvenc kiegeszitok:"
while [[ $CV -lt 3 ]]
do
  if [[ $CV -eq 0 ]]
  then
    read -p ""$SORSZAM". ruhadarab: " egyebek[egy]
  elif [[ $CV -eq 1 ]]
  then
    read -p ""$SORSZAM". ruhadarab: " egyebek[ketto]
  else
    read -p ""$SORSZAM". ruhadarab: " egyebek[harom]
  fi
  ((CV=CV+1))
  ((SORSZAM=SORSZAM+1))
done

echo""
while [[ $ISMETLES -eq 1 ]]
do
  echo "Az On tokeletes szettje mara:"

  ((SWITCH = $RANDOM % 3 + 1))
  case "$SWITCH" in
  1)
    echo "${polok[egy]}"
    ;;
  2)
    echo "${polok[ketto]}"
    ;;
  *)
    echo "${polok[harom]}"
    ;;
  esac

  ((SWITCH = $RANDOM % 3 + 1))
  case "$SWITCH" in
  1)
    echo "${nadragok[egy]}"
    ;;
  2)
    echo "${nadragok[ketto]}"
    ;;
  *)
    echo "${nadragok[harom]}"
    ;;
  esac

  ((SWITCH = $RANDOM % 3 + 1))
  case "$SWITCH" in
  1)
    echo "${cipok[egy]}"
    ;;
  2)
    echo "${cipok[ketto]}"
    ;;
  *)
    echo "${cipok[harom]}"
    ;;
  esac

  ((SWITCH = $RANDOM % 3 + 1))
  case "$SWITCH" in
  1)
    echo "${egyebek[egy]}"
    ;;
  2)
    echo "${egyebek[ketto]}"
    ;;
  *)
    echo "${egyebek[harom]}"
    ;;
  esac

  echo ""
  read -p "Ha uj szettet szeretne a megadott ruhakbol, irja be: 1: " UJRA
  ((ISMETLES=UJRA))
done