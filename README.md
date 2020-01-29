**Automation API Test using Robot Framework**

How to use :

git clone https://github.com/adidrmwan/robotframework-api.git

cd robotframework-api

pip install robotframework

pip install -r requirements.txt



**How to run - Single Execution By Testcase**

robot -t {testcase_name} testCases/{file_name}.robot

**How to run - Only Positive Cases By Tags**

robot -i {tags_name} testCases/{file_name}.robot

**How to run - Single Execution By Module**

robot testCases/{file_name}.robot
