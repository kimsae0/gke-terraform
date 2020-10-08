# TTC-Team07 IaC(Terraform) 사용 설명

1. terraform.tfvars 파일에서 변수 수정

2. terraform Provider 다운로드 및 실행 환경 Initailize

   ```
   terraform init
   ```

   

3. 리소스 생성

   ```
   terraform apply --var-file="terraform.tfvars" 
   ```

   

4. 리소스 삭제

   ```
   terraform destroy --var-file="terraform.tfvars"
   ```

   