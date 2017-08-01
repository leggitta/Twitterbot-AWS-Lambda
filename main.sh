# delete existing function
aws lambda delete-function \
--function-name twitterbot

# zip dependencies
pip install tweepy -t ./lambda
cd ./lambda
zip -r ../lambda.zip .
cd ..

# create the lambda function 
aws lambda create-function \
--function-name twitterbot \
--runtime python3.6 \
--role arn:aws:iam::298843981868:role/service-role/TwitterBot \
--handler handler.tweet \
--zip-file "fileb://lambda.zip"
