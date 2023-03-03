CPATH='.;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

if [[ -f student-submission/ListExamples.java ]]
then
    echo 'found the file'
else
    echo 'cannot find the file'
    exit 1
fi

cp TestListExamples.java student-submission
cp -r lib student-submission

cd student-submission

javac -cp $CPATH *.java

if [[ $? -eq 0 ]]
then
    echo 'compile success!'
else
    echo 'compile failed'
    exit 1
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples
