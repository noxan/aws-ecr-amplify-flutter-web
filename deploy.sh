docker build -t amplify-flutter-web .

aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/l9a8u8t0

docker tag amplify-flutter-web:latest public.ecr.aws/l9a8u8t0/amplify-flutter-web:latest

docker push public.ecr.aws/l9a8u8t0/amplify-flutter-web:latest
