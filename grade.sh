CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [[ -f student-submission/ListExamples.java ]]
then 
    echo "The file ListExamples.java exists in the directory"
else 
    echo "The file ListExamples.java doesn't exist in the directory"
    exit 1
fi

cp TestListExamples.java grading-area 
cp student-submission/ListExamples.java grading-area 

javac -cp $CPATH grading-area/*.java

if [[ $? -eq 0 ]]
then    
    echo "Compile success!"
else
    echo "Compile failure"
fi
# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests