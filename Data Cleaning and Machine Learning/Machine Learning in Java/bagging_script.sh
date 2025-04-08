#!/bin/bash

CLAS="/Applications/weka-3.8.6.app/Contents/app/weka.jar"
OUTPUT_J48="/Users/brianmcmahon/Documents/COMP 47460 - ML/Assignment_2/WEKAoutputs/output_j48.txt"
OUTPUT_1NN="/Users/brianmcmahon/Documents/COMP 47460 - ML/Assignment_2/WEKAoutputs/output_1nn.txt"
OUTPUT_PERCEPTRON="/Users/brianmcmahon/Documents/COMP 47460 - ML/Assignment_2/WEKAoutputs/output_perceptron.txt"
MODEL="/Users/brianmcmahon/Documents/COMP 47460 - ML/Assignment_2/trees.model"  # Model path as a variable
DATA="/Users/brianmcmahon/Documents/COMP 47460 - ML/Assignment_2/spotify_15463152_normalized.arff"

# echo "Working on J48"

# for i in 2 4 6 8 10 12 14 16 18 20 #10 20 30 40 50 60 70 80 90 100
# do
#   echo "Working on J48 i $i"
#   java --add-opens java.base/java.lang=ALL-UNNAMED -cp $CLAS \
#     weka.classifiers.meta.Bagging \
#     -P 20 \
#     -S 1 \
#     -num-slots 1 \
#     -I $i \
#     -t "$DATA" \
#     -W weka.classifiers.trees.J48 -- -C 0.25 -M 20 >> "/Users/brianmcmahon/Documents/COMP 47460 - ML/Assignment_2/WEKAoutputs/output_j48_p02_c25_m20_P20.txt"
#     echo "\n BREAKBREAKBREAK" >> "/Users/brianmcmahon/Documents/COMP 47460 - ML/Assignment_2/WEKAoutputs/output_j48_p02_c25_m20_P20.txt"
# done

echo "Working on 1NN"

for i in 10 20 30 40 50 60 70 80 90 100 #2 4 6 8 10 12 14 16 18 20
do
    echo "Working on 1NN i $i"
  java --add-opens java.base/java.lang=ALL-UNNAMED -cp $CLAS \
    weka.classifiers.meta.Bagging \
    -P 100 \
    -S 1 \
    -num-slots 1 \
    -I $i \
    -t "$DATA" \
    -W weka.classifiers.lazy.IBk -- -K 1 -W 0 -I -A "weka.core.neighboursearch.LinearNNSearch -A \"weka.core.EuclideanDistance -R first-last\"" >> "/Users/brianmcmahon/Documents/COMP 47460 - ML/Assignment_2/WEKAoutputs/output_1NN_vary_bag_size.txt" #"$OUTPUT_1NN"
    echo "\n BREAKBREAKBREAK" >> "/Users/brianmcmahon/Documents/COMP 47460 - ML/Assignment_2/WEKAoutputs/output_j48_p02_c25_m20_P20.txt" #"$OUTPUT_1NN"
done

# echo "Working on Perceptron"

# for i in 2 4 6 8 10 12 14 16 18 20
# do
#     echo "Working on perceptron i $i"
#   java --add-opens java.base/java.lang=ALL-UNNAMED -cp $CLAS \
#     weka.classifiers.meta.Bagging \
#     -P 100 \
#     -S 1 \
#     -num-slots 1 \
#     -I $i \
#     -t "$DATA" \
#     -W weka.classifiers.functions.MultilayerPerceptron -- -L 0.3 -M 0.2 -N 500 -V 0 -S 0 -E 20 -H t >> "$OUTPUT_PERCEPTRON"
#     echo "\n BREAKBREAKBREAK" >> "$OUTPUT_PERCEPTRON"
# done


# java --add-opens java.base/java.lang=ALL-UNNAMED -cp $CLAS \
#     weka.classifiers.meta.Bagging \
#     -P 100 \
#     -S 1 \
#     -num-slots 1 \
#     -I 10 \
#     -t "$DATA" \
#     -W weka.classifiers.lazy.IBk -- -K 1 -W 0 -I -A "weka.core.neighboursearch.LinearNNSearch -A \"weka.core.EuclideanDistance -R first-last\"" 
# # >> "$OUTPUT_FILE"

# java --add-opens java.base/java.lang=ALL-UNNAMED -cp $CLAS weka.classifiers.meta.Bagging -P 100 -S 1 -num-slots 1 -I 20 -t "$DATA" -W weka.classifiers.functions.MultilayerPerceptron -- -L 0.3 -M 0.2 -N 500 -V 0 -S 0 -E 20 -H t >> "$OUTPUT_PERCEPTRON"