# newrelic_demo_java
You need to modify "your-newrelic-key" in the script "run.sh"＜/br＞
build docker images＜/br＞
```docker build -t msfhubanbei/sample .```＜/br＞
run docker       
```docker run -d -p 58081:8080 msfhubanbei/sample```      

It will take about 10 minutes for startting up tomcat./br
Then you can access the sample by  http://your-machineip:58081/sample/.＜/br＞
