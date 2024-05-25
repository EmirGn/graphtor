#!/bin/bash

python_script="main.py"
date=$(date +%Y-%m-%d)

read -p "Enter your total working hours: " totalHours
read -p "Enter your total estimated distractions: " distractions
read -p "Enter the number of accomplished tasks: " tasks

efficiency=$(echo "scale=2; (($totalHours - $distractions) / $totalHours) * 100" | bc -l)
productivity_score=$(echo "scale=2; (($tasks / $totalHours) * 0.4) + (($efficiency / 100) * 0.6)" | bc -l)

plotPlace="/Users/emirg/Obsidian/nodeheus/Nodeheus/attachment"
search_directory="/Users/emirg/Obsidian/nodeheus"

echo "$date, $productivity_score" >> datesValues.csv
python3 "$python_script"

mv "plot.png" "$plotPlace"
read -p "Where is the plot located (Exact name of the file.): " locatedName

textToCheck="![[plot.png]]"

result=$(find "$search_directory" -type f -name "$locatedName")
echo "$result", "$search_directory", "$locatedName"
if grep -qF "$textToCheck" "$result"; then
    echo "Text is found, replaced."
else
    echo "Text is not found, adding."
    echo "$textToCheck" >> "$result"
fi