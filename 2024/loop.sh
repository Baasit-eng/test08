#!/bin/bash
####### For loop ##########
'''
for club in England Spain Germany France Italy Austria
do
  if [[ $club == England ]]
  then
      echo $club
      echo "Clubs in $club are: 
      Man u
      Chelsea
      Man City
      Liverpool
      Tottenham
      Arsenal etc..."
  elif [[ $club ==  Spain ]]
  then
      echo $club
      echo "Club in $club are:
      Real Madrid
      Barcelona
      Atletico Madrid
      Girona
      Osasuna
      Real Betis etc..."
  elif [[ $club == Italy ]]
  then
      echo $club
      echo "Club in $club are:
      Juvetus
      Inter Millan
      AC Millan
      Atlanta
      Bologna
      Sampodria etc..."
  elif [[ $club == France ]]
  then
      echo $club
      echo "Club in $club are:
      PSG
      PSV
      Angers
      Lille
      Lyon
      Marseille etc..."
  elif [[ $club == Germany ]]
  then
      echo $club
      echo "Club in $club are:
      Bayern Munchen
      Dortmund
      Bayern Leverkusen
      Wolfsburg
      Stuttgart
      Leipzig etc..."
  elif [[ $club == Austria ]]
  then
      break
  fi
  sleep 3
done


####### Select loop ################## 
value="scheduled not_scheduled quit"
PS3="Please select output: "

select output in $value
do
  echo $output
  if [[ $output == "quit" ]]
  then
      break
  fi
done
'''
value="England Spain Germany France Italy exit"
PS3="Please select option: "

select club in $value
do
  if [[ $club == England ]]
  then
      echo $club
      echo "Clubs in $club are:
      Man u
      Chelsea
      Man City
      Liverpool
      Tottenham
      Arsenal etc..."
  elif [[ $club ==  Spain ]]
  then
      echo $club
      echo "Club in $club are:
      Real Madrid
      Barcelona
      Atletico Madrid
      Girona
      Osasuna
      Real Betis etc..."
  elif [[ $club == Italy ]]
  then
      echo $club
      echo "Club in $club are:
      Juvetus
      Inter Millan
      AC Millan
      Atlanta
      Bologna
      Sampodria etc..."
  elif [[ $club == France ]]
  then
      echo $club
      echo "Club in $club are:
      PSG
      PSV
      Angers
      Lille
      Lyon
      Marseille etc..."
  elif [[ $club == Germany ]]
  then
      echo $club
      echo "Club in $club are:
      Bayern Munchen
      Dortmund
      Bayern Leverkusen
      Wolfsburg
      Stuttgart
      Leipzig etc..."
  elif [[ $club == exit ]]
  then
      break
  fi
  sleep 3
done
####### While Loop###########
counter=1
while [[ $counter -le 10 ]]
do
   echo "counter is $counter"
   ((counter++))
done
#infinity loop
while :
do 
  echo "serching for the Directory..."
  sleep 1
  if [[ -d luffy ]]
  then
      echo "Directory found!"
      echo "Infinity loop Ended..."
      break
  fi
done
##########################################
number=1
while read $SCHEMA
do
  if [[ $number < 2 || $number == 2 ]]
  then
      echo "The number $number Schema is $SCHEMA"
      ((number++))
  else
      break
  fi
done < /home/Baasit/devops/2024/schema.sh
