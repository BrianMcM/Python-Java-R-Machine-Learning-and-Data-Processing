#!/bin/bash

CLAS="/Applications/weka-3.8.6.app/Contents/app/weka.jar"
OUTPUT_J48="/Users/brianmcmahon/Documents/COMP 47460 - ML/Assignment_2/WEKAoutputs/output_j48_bag_size.txt"
OUTPUT_1NN="/Users/brianmcmahon/Documents/COMP 47460 - ML/Assignment_2/WEKAoutputs/output_1nn_bag_size.txt"
OUTPUT_PERCEPTRON="/Users/brianmcmahon/Documents/COMP 47460 - ML/Assignment_2/WEKAoutputs/output_perceptron_bag_size.txt"
MODEL="/Users/brianmcmahon/Documents/COMP 47460 - ML/Assignment_2/trees.model"  # Model path as a variable
DATA="/Users/brianmcmahon/Documents/COMP 47460 - ML/Assignment_2/spotify_15463152_normalized.arff"


echo "bag size variation"
echo "Working on J48"

for i in 10 20 30 40 #50 60 70 80 90 100 110 120 130 140 150
do
  echo "Working on J48 i $i"
  java --add-opens java.base/java.lang=ALL-UNNAMED -cp $CLAS \
    weka.classifiers.meta.Bagging \
    -P $i \
    -S 1 \
    -num-slots 1 \
    -I 20 \
    -t "$DATA" \
    -W weka.classifiers.trees.J48 -- -C 0.25 -M 2 >> "$OUTPUT_J48"
    echo "\n BREAKBREAKBREAK" >> "$OUTPUT_J48"
done

echo "Working on 1NN"

for i in 10 20 30 40 #50 60 70 80 90 100 110 120 130 140 150
do
    echo "Working on 1NN i $i"
  java --add-opens java.base/java.lang=ALL-UNNAMED -cp $CLAS \
    weka.classifiers.meta.Bagging \
    -P $i \
    -S 1 \
    -num-slots 1 \
    -I 20 \
    -t "$DATA" \
    -W weka.classifiers.lazy.IBk -- -K 1 -W 0 -I -A "weka.core.neighboursearch.LinearNNSearch -A \"weka.core.EuclideanDistance -R first-last\"" >> "$OUTPUT_1NN"
    echo "\n BREAKBREAKBREAK" >> "$OUTPUT_1NN"
done

echo "Working on Perceptron"

for i in 10 20 30 40 #50 60 70 80 90 100 110 120 130 140 150
do
    echo "Working on perceptron i $i"
  java --add-opens java.base/java.lang=ALL-UNNAMED -cp $CLAS \
    weka.classifiers.meta.Bagging \
    -P $i \
    -S 1 \
    -num-slots 1 \
    -I 12 \
    -t "$DATA" \
    -W weka.classifiers.functions.MultilayerPerceptron -- -L 0.3 -M 0.2 -N 500 -V 0 -S 0 -E 20 -H t >> "$OUTPUT_PERCEPTRON"
    echo "\n BREAKBREAKBREAK" >> "$OUTPUT_PERCEPTRON"
done
